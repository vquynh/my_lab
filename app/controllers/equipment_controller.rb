class EquipmentController < ApplicationController
  layout "equipment"
  
  def index
    @labor_items = Equipment.all
    @page_title = "MyLab Equipment"
  end

  def el
    @labor_items = Equipment.el
    @page_title = "MyLab Electronic Equipment"
  end

  def measure
    @labor_items = Equipment.measure
  end

  def misc
    @labor_items = Equipment.misc
  end

  def software
    @labor_items = Equipment.software
  end

  def audio
    @labor_items = Equipment.audio
  end

  def video
    @labor_items = Equipment.video
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
