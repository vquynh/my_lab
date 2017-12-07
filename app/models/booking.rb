class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :booking_status
  before_create :set_booking_status
  has_many :booking_items
  has_many :equipment, through: :booking_items

  private

  def set_booking_status
    self.booking_status_id = 1
  end

  def set_user
    self.user_id = current_user_id
  end

end
