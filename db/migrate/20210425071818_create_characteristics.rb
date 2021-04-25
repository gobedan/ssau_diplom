class CreateCharacteristics < ActiveRecord::Migration[6.1]
  def change
    create_table :characteristics do |t|
      t.string :name
      t.references :measure_unit, foreign_key: true
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
