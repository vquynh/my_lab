class Project < ApplicationRecord
  has_many :users
  has_many :bookings

  mount_uploader :thumb_image, ImageUploader
  mount_uploader :main_image, ImageUploader
end
