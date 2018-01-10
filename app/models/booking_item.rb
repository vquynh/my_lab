class BookingItem < ApplicationRecord
  belongs_to :equipment
  belongs_to :booking

  validates :booking_quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :equipment_present
  validate :booking_present
  alias_attribute :labor_item_id, :equipment_id

  private

  def equipment_present
    errors.add(:equipment, 'is not valid or is not active.') if equipment.nil?
  end

  def booking_present
    errors.add(:booking, 'is not a valid order.') if booking.nil?
  end
end
