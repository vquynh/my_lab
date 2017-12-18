class AddPositionToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :position, :integer
  end
end
