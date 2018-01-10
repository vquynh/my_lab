class BookingsController < ApplicationController
  access user: {except: [:destroy, :indexadmin]}, admin: :all


  def indexadmin
    @all_bookings = Booking.all
    @bookings = Booking.where(pickup_date: params[:start]..params[:end])
    respond_to do |format|
      format.html
      format.json
    end
    @bookings_pending = Booking.pending
    @bookings_confirmed = Booking.confirmed
    @bookings_claimed = Booking.claimed
    @bookings_unclaimed = Booking.unclaimed
    @bookings_overdue = Booking.overdue
    @bookings_returned = Booking.returned
  end

  def sort
    params[:order].each do |key, value|
      Booking.find(value[:id]).update(position: value[:position])
    end

    render body: nil
  end

  def index
    @bookings = current_user.bookings
    @users = User.joins(:bookings).distinct
  end

  def new
    @booking = Booking.new
    session[:booking_id] = @booking.id
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save(booking_params)
        if logged_in?(:admin)
          format.html { redirect_to indexadmin_bookings_path, notice: 'Booking was successfully created.' }
        else
          format.html { redirect_to bookings_path, notice: 'Booking was successfully created.' }
        end
      else
        format.html { render :new }
      end
    end

  end

  def edit
    @booking = Booking.find(params[:id])
    @booking_items = @booking.booking_items
    @labor_items = Equipment.joins(:booking_items).where("booking_id = ?", params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update(booking_params)
        if logged_in?(:admin)
          format.html { redirect_to indexadmin_bookings_path, notice: 'Booking was successfully updated.' }
        else
          format.html { redirect_to bookings_path, notice: 'Booking was successfully updated.' }
        end
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @booking_items = @booking.booking_items
    @labor_items = Equipment.joins(:booking_items).where("booking_id = ?", params[:id])
  end

  def destroy
    # Look up
    @booking = Booking.find(params[:id])

    # Destroy/Delete the record
    @booking_items = @booking.booking_items
    @booking_items.each(&:destroy)
    @booking.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to indexadmin_bookings_path, notice: 'Booking was removed.' }
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

