class BookingItemsController < ApplicationController
  def create
    @booking = current_booking
    @booking_item = @booking.booking_items.new(booking_item_params)
    @booking.save!
    session[:booking_id] = @booking.id
  end

  def update
    @booking = current_booking
    @booking_item = @booking.booking_items.find(params[:id])
    @booking_item.update_attributes(booking_item_params)
    @booking_items = @booking.booking_items
  end

  def destroy
    @booking = current_booking
    @booking_item = @booking.booking_items.find(params[:id])
    @booking_item.destroy
    @booking_items = @booking.booking_items
  end

private
  def booking_item_params
    params.require(:booking_item).permit(:quantity, :labor_item_id)
  end
end
