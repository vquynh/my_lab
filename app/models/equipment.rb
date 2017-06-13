class Equipment < ApplicationRecord
  belongs_to :category
  belongs_to :equipment_status
end
