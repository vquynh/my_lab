class ListController < ApplicationController
  layout "list"  
  def show
    @booking_items = current_booking.booking_items
  end
end
