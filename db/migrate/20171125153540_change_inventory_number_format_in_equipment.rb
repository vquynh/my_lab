class ChangeInventoryNumberFormatInEquipment < ActiveRecord::Migration[5.1]
  def change
    change_column :equipment, :inv_nr, :string
  end
end
