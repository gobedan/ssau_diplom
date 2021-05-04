require 'open-uri'
require 'nokogiri'
require 'redis'

class Services::Parser 
  def self.parse(params)
    redis = Redis.new(host: "localhost")
    html = open(params.catalog_url)
    doc = Nokogiri::HTML(html)
    domain = params.target_site

    products = []
    doc.css(params.product_selector).each do |product|
      product_link = product['href']
      product_link.prepend(domain) unless product['href'].start_with?('http')
      product_page = open(product_link)
      product_doc = Nokogiri::HTML(product_page)
      title = product_doc.css(params.title_selector).text
      price = product_doc.css(params.price_selector).text  #TODO formatting
      image = product_doc.css(params.image_selector).first['src']
      
      characteristics = []
      doc.css(params.characteristics_selector).each do |characteristic|
        key = characteristic.text.split(':')[0]
        value = characteristic.text.split(':')[1]
        characteristics.push({"#{key}": value})
      end

      products.push(
        "name": title,
        "price": price,
        "picture_url": image,
        "characteristics": characteristics
      )

    end
    redis.set("#{params.id}", products.to_json)
    console.log(redis.get("#{params.id}"))
  end

  def self.insert_results(id)
    redis = Redis.new(host: "localhost")
    products = JSON.parse(redis.get(id.to_s))
    console.log(products)


  end
end
