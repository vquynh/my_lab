class CreateEquipment < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :inv_nr
      t.text :description
      t.integer :quantity
      t.text :thumb_image
      t.text :main_image
      t.references :category, foreign_key: true
      t.references :equipment_status, foreign_key: true

      t.timestamps
    end
  end
end
