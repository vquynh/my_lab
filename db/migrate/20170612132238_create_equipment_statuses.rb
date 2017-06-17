class CreateEquipmentStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
