class CreateJoinTableCharacteristicProduct < ActiveRecord::Migration[6.1]
  def change
    create_join_table :characteristics, :products do |t|
      t.string :value
    end
  end
end
