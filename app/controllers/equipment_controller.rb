class EquipmentController < ApplicationController
  layout "equipment"
  access all: [:show, :index, :el, :measure, :misc, :computer, :audio, :video], user: {except: [:destroy, :new, :create, :update, :edit]}, labor_staff: :all

  def index
    @available_items = Equipment.all
    available_item
    @page_title = "MyLab Equipment"
  end

  def available_item
    all_bookings = Booking.all
    @booking = current_booking
    start_date = @booking.pickup_date
    end_date = @booking.return_date

    if !start_date.nil? && !end_date.nil?
      overlapped_bookings = all_bookings.where("(pickup_date, return_date) OVERLAPS (?,?)", start_date, end_date)
      unless overlapped_bookings.nil?
        booked_items = []
        overlapped_bookings.each do |booking|
          booked_items += BookingItem.where("booking_id = ?", booking.id)
        end

        booked_items.each do |booking_item|
          booked_labor_item += Equipment.find(booking_item.equipment_id)
          @available_items -= Equipment.find(booked_labor_item.id)
          @available_items
        end
      end
    end
    @booking_item = @booking.booking_items.new
  end

  def el
    @available_items = Equipment.el
    available_item
    @page_title = "MyLab Electronic Equipment"
  end

  def measure
    @available_items = Equipment.measure
    available_item
    @page_title = "MyLab Messuring Equipment"
  end

  def misc
    @available_items = Equipment.misc
    available_item
    @booking_item = current_booking.booking_items.new
  end

  def computer
    @available_items = Equipment.computer
    available_item
    @booking_item = current_booking.booking_items.new
  end

  def audio
    @available_items = Equipment.audio
    available_item
    @booking_item = current_booking.booking_items.new
  end

  def video
    @available_items = Equipment.video
    available_item
    @booking_item = current_booking.booking_items.new
  end

  def new
    @labor_item = Equipment.new
  end

  def create
    @labor_item = Equipment.new(equipment_params)

    respond_to do |format|
      if @labor_item.save
        format.html { redirect_to equipment_index_path, notice: 'Equipment item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @labor_item = Equipment.find(params[:id])
  end

  def update
    @labor_item = Equipment.find(params[:id])

    respond_to do |format|
      if @labor_item.update(equipment_params)
        format.html { redirect_to equipment_index_path, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @labor_item = Equipment.find(params[:id])
    @page_title = "Mylab #{@labor_item.name}"
  end

  def destroy
    # Look up
    @labor_item = Equipment.find(params[:id])

    # Destroy/Delete the record
    @labor_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to equipment_url, notice: 'Item was removed.' }
    end
  end

private 
  def equipment_params
    params.require(:equipment).permit(:name,
                                      :inv_nr, 
                                      :description, 
                                      :quantity, 
                                      :category_id, 
                                      :equipment_status_id
                                      )

  end

end
