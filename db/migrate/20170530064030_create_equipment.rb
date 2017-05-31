class CreateEquipment < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :inv_nr
      t.text :description
      t.text :main_image
      t.text :thumb_image
      t.references :status

      t.timestamps
    end
  end
end
