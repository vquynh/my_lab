class Equipment < ApplicationRecord
  belongs_to :category
  belongs_to :equipment_status
  has_many :booking_items
  has_many :bookings, through: :booking_items

  def self.measure
    where(category_id: 1)
  end

  def self.el
    where(category_id: 2)
  end

  def self.audio
    where(category_id: 3)
  end

  def self.video
    where(category_id: 4)
  end

  def self.computer
    where(category_id: 5)
  end

  def self.misc
    where(category_id: 6)
  end

  def self.search(search)
    if search
      where('name ILIKE ? OR inv_nr ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self
    end
  end

  # @param [Object] return_date
  # @param [Object] pickup_date
  def self.filter_availability(pickup_date, return_date)
    if pickup_date && return_date
      equipment_ids = Booking.joins(:booking_items)
                          .select('equipment_id')
      .where('(pickup_date, return_date) OVERLAPS (?,?)',
                                 "%#{pickup_date}%", "%#{return_date}%")
      Equipment.where('id NOT IN (?)', equipment_ids)
    else
      self
    end
  end
end
