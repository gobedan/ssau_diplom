class Characteristic < ApplicationRecord
  belongs_to :measure_unit, optional: true
  belongs_to :subcategory, optional: true
  has_many :product, through: :characteristics_products
  has_many :characteristics_products
end
