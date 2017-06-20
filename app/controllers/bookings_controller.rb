class BookingsController < ApplicationController
  access user: {except: [:destroy, :new, :create, :update, :edit]}, labor_staff: :all


  def index
      if current_user.is_a?(labor_staff)
          @bookings = Booking.all
      else
          @bookings = Booking.find(params[:user_id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to bookings_path, notice: 'Booking was successfully submitted.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to bookings_path, notice: 'Booking was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    # Look up
    @booking = Booking.find(params[:id])

    # Destroy/Delete the record
    @booking.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to booking_url, notice: 'Booking was removed.' }
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:pickup_date,
                                    :return_date, 
                                    :message
                                    )

  end

end
