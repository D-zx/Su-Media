class CreateEquipment < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :total
      t.text :condition
      t.string :status

      t.timestamps
    end
  end
end
