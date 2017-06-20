class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.references :booking_status, foreign_key: true
      t.date :pickup_date
      t.date :return_date
      t.uuid :uuid

      t.timestamps
    end
  end
end
