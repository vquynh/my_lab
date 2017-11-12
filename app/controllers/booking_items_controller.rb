class BookingItemsController < ApplicationController
  def create
    @booking = current_booking
    @booking_item = @booking.booking_items.new(booking_item_params)
    @booking.save!
    session[:booking_id] = @booking.id
  end


  def edit
    @booking_item = BookingItem.find(params[:id])
  end

  def update
    @booking_item = BookingItem.find(params[:id])

    respond_to do |format|
      if @booking_item.update(booking_item_params)
        format.html { redirect_to booking_path, notice: 'Item  was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @list = current_booking
    @booking_item = BookingItem.find(params[:id])
    @booking = Booking.find(@booking_item.booking_id)
    @booking_item.destroy
    respond_to do |format|
      if @booking.id == @list.id
        format.html { redirect_to mylist_path, notice: 'Item was removed.' }
      else
        format.html { redirect_to edit_booking_path(@booking), notice: 'Item was removed.' }
      end
    end
  end

private
  def booking_item_params
    params.require(:booking_item).permit(:quantity, :labor_item_id)
  end
end
