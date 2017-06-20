class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :booking_status
end
