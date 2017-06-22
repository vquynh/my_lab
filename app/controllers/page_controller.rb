class PageController < ApplicationController
  def home
    @new_items = Equipment.last(3)
    @new_projects = Project.last(3)
    @count = BookingItem.group(:equipment_id).count.first
    @fav_items = Equipment.joins(:booking_items).distinct
  end

  def about
  end

  def contact
  end
end
