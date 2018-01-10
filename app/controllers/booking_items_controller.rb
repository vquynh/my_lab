class BookingItemsController < ApplicationController
  def create
    @booking = current_booking
    @booking_items = @booking.booking_items
    same_item = @booking_items.find_by_equipment_id(params[:booking_item][:labor_item_id])
    if same_item.nil?
      @booking_item = @booking.booking_items.new(booking_item_params)
    else
      same_item.quantity = same_item.quantity + params[:booking_item][:booking_quantity].to_i
      same_item.save!
    end
    @booking.save!
    flash[:success] = 'Added to your list!'
    session[:booking_id] = @booking.id
  end

  def edit
    @booking_item = BookingItem.find(params[:id])
  end

  def update
    @list = current_booking
    @booking_item = BookingItem.find(params[:id])
    @booking = Booking.find(@booking_item.booking_id)

    respond_to do |format|
      if @booking_item.update(booking_item_params)
        if @booking.id == @list.id
          format.html { redirect_to mylist_path}
        else
          format.html { redirect_to edit_booking_path(@booking)}
        end
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
        format.html { redirect_to mylist_path}
      else
        format.html { redirect_to edit_booking_path(@booking)}
      end
    end
  end

private
  def booking_item_params
    params.require(:booking_item).permit(:booking_quantity, :labor_item_id)
  end
end
