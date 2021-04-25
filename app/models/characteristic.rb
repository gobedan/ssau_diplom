class Characteristic < ApplicationRecord
  belongs_to :measure_unit, optional: true
  belongs_to :subcategory, optional: true
end
