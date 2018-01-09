class Equipment < ApplicationRecord
  belongs_to :category
  belongs_to :equipment_status
  has_many :booking_items
  has_many :bookings, through: :booking_items, dependent: :nullify

  mount_uploader :thumb_image, ImageUploader
  mount_uploader :main_image, ImageUploader

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
      all
    end
  end

  # @param [Object] pickup_date
  # @param [Object] return_date
  # @return [Object] quantity
  def available_quantity(pickup_date, return_date)
    if pickup_date && return_date
      booked_quantity = Booking
                               .joins(:booking_items)
                               .where('(pickup_date, return_date) OVERLAPS (?,?) AND equipment_id=?', "%#{pickup_date}%", "%#{return_date}%", id)
                               .group(:equipment_id)
                            .sum(:quantity)
    else
      booked_quantity = Booking
                            .joins(:booking_items)
                            .where('(pickup_date, return_date) OVERLAPS (?,?) AND equipment_id=?', Date.today, Date.today + 1.days, id)
                            .group(:equipment_id)
                            .sum(:quantity)

    end
    booked_quantity.empty? ? quantity : quantity - booked_quantity.reduce(:-).drop(1).join.to_i
  end

end
