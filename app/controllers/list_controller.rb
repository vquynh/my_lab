class ListController < ApplicationController
  layout "list"  
  def show
    @booking_items = current_booking.booking_items
  end

  def add_list_to_booking
    this_booking_id = session[:booking_id]
    @booking_items = Booking.find(this_booking_id).booking_items
    session[:booking_id] = nil
    redirect_to edit_booking_path(Booking.find(this_booking_id))
  end
end
