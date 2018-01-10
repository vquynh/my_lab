class PageController < ApplicationController
  def home
    @new_items = Equipment.last(3)
    @new_projects = Project.last(3)
    @count = BookingItem.group(:equipment_id).count.first
    last_booked_equipment_ids = BookingItem.order('id DESC').select('equipment_id').limit(3)


    @recently_booked_items = Equipment.where('id IN (?)', last_booked_equipment_ids)

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
