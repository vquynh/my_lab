class PageController < ApplicationController
  def home
    @new_items = Equipment.last(3)
    @new_projects = Project.last(3)
    @count = BookingItem.group(:equipment_id).count.first
    last_booking_item_ids = BookingItem.distinct.last(3).select('equipment_id')
    @recently_booked_items = Equipment.where('id IN (?)', last_booking_item_ids)

    fav_equipment_ids = BookingItem.select('equipment_id')
                            .group(:equipment_id)
                            .order('COUNT(equipment_id) DESC')
                            .limit(3)
    @fav_items = Equipment.where('id IN (?)', fav_equipment_ids)
  end

  def about
  end

  def contact
  end
end
