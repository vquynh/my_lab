class Equipment < ApplicationRecord
  belongs_to :category
  belongs_to :equipment_status
  has_many :booking_items
    

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

end
