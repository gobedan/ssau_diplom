require 'open-uri'
require 'nokogiri'
require 'redis'

class Parser 
  def self.parse(params)
    redis = Redis.new(host: "localhost")
    html = URI.open(params.catalog_url)
    doc = Nokogiri::HTML(html)
    domain = params.target_site

    products = []
    doc.css(params.product_selector).each do |product|
      product_link = product['href']
      product_link.prepend(domain) unless product['href'].start_with?('http')
      product_page = URI.open(product_link)
      product_doc = Nokogiri::HTML(product_page)
      title = product_doc.css(params.title_selector).text
      price = product_doc.css(params.price_selector).text.tr(' ', '').to_i
      image = product_doc.css(params.image_selector).first['src']  
      characteristics = []
      product_doc.css(params.characteristics_selector).each do |characteristic|
        key = characteristic.text.split(':')[0]
        value = characteristic.text.split(':')[1]
        characteristics.push({"#{key}": value})
      end

      products.push(
        "name": title,
        "price": price,
        "picture_url": image,
        "subcategory_id": params.subcategory_id,
        "characteristics": characteristics
      )

    end
    redis.set("#{params.id}", products.to_json)
  end

  def self.insert_results(id)
    redis = Redis.new(host: "localhost")
    products = JSON.parse(redis.get(id.to_s))
    products.each do |product|
      unless Product.find_by(name: product['name'])
        result_product = Product.create(name: product['name'], 
                                     picture_url: product['picture_url'], 
                                     subcategory_id: product['subcategory_id'], 
                                     price: product['price'])

        product['characteristics'].each do |spec|
          spec_name = spec.first.first
          spec_measure_unit = spec.first.last[/\d(\D*)$/, 1]&.strip
          spec_measure_unit ? spec_value = spec.first.last[/^(.*\d)\D*$/, 1]&.strip : spec_value = spec.first.last

          result_spec = Characteristic.find_by(name: spec_name) || 
                        Characteristic.create({name: spec_name, 
                                               measure_unit: MeasureUnit.create({name: spec_measure_unit}), 
                                               subcategory_id: result_product.subcategory_id })
          
          result_product.characteristics_products.create({characteristic_id: result_spec.id, value: spec_value})
          
        end
      end 

    end

  end
end
