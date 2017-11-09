class CreateBookingItems < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_items do |t|
      t.references :equipment, foreign_key: true
      t.references :booking, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
