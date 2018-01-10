class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :booking_items, :quantity, :booking_quantity

  end
end
