class AddColumnsToParsingJob < ActiveRecord::Migration[6.1]
  def change
    add_reference :parsing_jobs, :subcategory, foreign_key: true
    add_column :parsing_jobs, :target_site,  :string
    add_column :parsing_jobs, :catalog_url, :string
    add_column :parsing_jobs, :product_selector, :string
    add_column :parsing_jobs, :title_selector, :string
    add_column :parsing_jobs, :price_selector, :string
    add_column :parsing_jobs, :image_selector, :string
    add_column :parsing_jobs, :characteristics_selector, :string
  end
end
