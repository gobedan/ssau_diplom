class CreateMeasureUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :measure_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
