class Product < ApplicationRecord
  belongs_to :subcategory
  has_many :products, through: :characteristics_products
  has_many :characteristics_products
end
