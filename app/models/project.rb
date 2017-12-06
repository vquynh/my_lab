class Project < ApplicationRecord
      has_many :users
      has_many :bookings
end
