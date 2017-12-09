class EquipmentController < ApplicationController
  layout "equipment"
  access all: [:show, :index, :el, :measure, :misc, :computer, :audio, :video],
         user: {except: [:destroy, :new, :create, :update, :edit]}, labor_staff: :all

  def index
    @available_items = set_search_and_filter
    @booking = current_booking
    @booking_item = @booking.booking_items.new
    @page_title = "MyLab Equipment"
  end

  def el
    @available_items = set_search_and_filter.el
    @booking = current_booking
    @booking_item = @booking.booking_items.new
    @page_title = "MyLab Electronic Equipment"
  end

  def measure
    @available_items = set_search_and_filter.measure
    @booking = current_booking
    @booking_item = @booking.booking_items.new
    @page_title = "MyLab Messuring Equipment"
  end

  def misc
    @available_items = set_search_and_filter.misc
    @booking = current_booking
    @booking_item = @booking.booking_items.new
    @booking_item = current_booking.booking_items.new
  end

  def computer
    @available_items = set_search_and_filter.computer
    @booking = current_booking
    @booking_item = @booking.booking_items.new
    @booking_item = current_booking.booking_items.new
  end

  def audio
    @available_items = set_search_and_filter.audio
    @booking = current_booking
    @booking_item = @booking.booking_items.new
    @booking_item = current_booking.booking_items.new
  end

  def video
    @available_items = set_search_and_filter.video
    @booking = current_booking
    @booking_item = @booking.booking_items.new
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

  def set_search_and_filter
    if !params[:pickup_date].to_s.empty? && !params[:return_date].to_s.empty?
      Equipment.search(params[:search]).filter_availability(params[:pickup_date], params[:return_date])
    else
      Equipment.search(params[:search]).filter_availability(Date.today, Date.today)
    end
  end

private
  def equipment_params
    params.require(:equipment).permit(:name,
                                      :inv_nr, 
                                      :description, 
                                      :quantity, 
                                      :category_id, 
                                      :equipment_status_id,
                                      :main_image,
                                      :thumb_image
                                      )

  end

end
