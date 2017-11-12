class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :booking_status
  before_create :set_booking_status
  has_many :booking_items

private
  def set_random_uuid
    begin
      self.uuid = ('a'..'z').to_a.shuffle[0,8].join
    end while Booking.where(uuid: self.uuid).exists?
  end

  def set_booking_status
    self.booking_status_id = 1
  end
  def set_user
    self.user_id = current_user_id
  end
  def self.by_position
    order("position ASC")
  end

  def self.pending
    where(booking_status_id: 1)
  end

  def self.confirmed
    where(booking_status_id: 2)
  end

  def self.claimed
    where(booking_status_id: 3)
  end

  def self.unclaimed
    where(booking_status_id: 4)
  end

  def self.overdue
    where(booking_status_id: 5)
  end

  def self.returned
    where(booking_status_id: 6)
  end

  def self.reported
    where(booking_status_id: 7)
  end

end
