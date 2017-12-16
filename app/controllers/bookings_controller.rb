class BookingsController < ApplicationController
  access user: {except: [:destroy, :indexadmin]}, labor_staff: :all


  def indexadmin
    @bookings = Booking.where(pickup_date: params[:start]..params[:end])
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  def index
    @bookings = Booking.where(pickup_date: params[:start]..params[:end])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @booking = Booking.new
    session[:booking_id] = @booking.id
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.save!

  end

  def edit
    @booking = Booking.find(params[:id])
    @booking_items = @booking.booking_items
    @labor_item = Equipment.joins(:booking_items)
  end

  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_path, notice: 'Booking was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @booking_items = @booking.booking_items
  end

  def destroy
    # Look up
    @booking = Booking.find(params[:id])

    # Destroy/Delete the record
    @booking_items = @booking.booking_items
    @booking_items.destroy
    @booking.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to booking_path, notice: 'Booking was removed.' }
    end
  end

private
  def booking_params
    params.require(:booking).permit(:pickup_date,
                                    :return_date,
                                    :user_id,
                                    :current_user,
                                    :project_id,
                                    :booking_status_id,
                                    :message
                                    )

  end
private
  def users
    User.joins(:bookings)
  end
end
