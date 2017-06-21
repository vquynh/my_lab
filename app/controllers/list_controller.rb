class ListController < ApplicationController
  def show
    @booking_items = current_booking.booking_items
  end
end
