class EquipmentController < ApplicationController
  access all: %i[show index el measure misc computer audio video],
         user: {except: %i[destroy new create update edit]}, labor_staff: :all

  def index
    @labor_items = Equipment.search(params[:search])
    define_booking_and_booking_item
    @page_title = "MyLab All Equipment"
  end

  def el
    @labor_items = Equipment.search(params[:search]).el
    define_booking_and_booking_item
    @page_title = "MyLab Electronic Equipment"
  end

  def measure
    @labor_items = Equipment.search(params[:search]).measure
    define_booking_and_booking_item
    @page_title = "MyLab Messuring Equipment"
  end

  def misc
    @labor_items = Equipment.search(params[:search]).misc
    define_booking_and_booking_item
    @page_title = "MyLab Miscellaneous Equipment"
  end

  def computer
    @labor_items = Equipment.search(params[:search]).computer
    define_booking_and_booking_item
    @page_title = "MyLab Computer Equipment"
  end

  def audio
    @labor_items = Equipment.search(params[:search]).audio
    define_booking_and_booking_item
    @page_title = "MyLab Audio Equipment"
  end

  def video
    @labor_items = Equipment.search(params[:search]).video
    define_booking_and_booking_item
    @page_title = "MyLab Video Equipment"
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
  def define_booking_and_booking_item
    @booking = current_booking
    @booking_item = @booking.booking_items.new
  end

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
