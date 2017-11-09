class BookingItem < ApplicationRecord
  belongs_to :equipment
  belongs_to :booking

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :equipment_present
  validate :booking_present
  alias_attribute :labor_item_id, :equipment_id

private
    def equipment_present
      if equipment.nil?
        errors.add(:equipment, "is not valid or is not active.")
      end
    end

    def booking_present
      if booking.nil?
        errors.add(:booking, "is not a valid order.")
      end
    end


end
