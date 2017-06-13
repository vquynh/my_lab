class EquipmentController < ApplicationController
  def index
    @labor_items = Equipment.el
  end

  def new
    @labor_item = Equipment.new
  end

  def create
    @labor_item = Equipment.new(params.require(:equipment).permit(:name, :inv_nr, :description))

    respond_to do |format|
      if @labor_item.save
        format.html { redirect_to equipment_path, notice: 'Equipment item was successfully created.' }
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
      if @labor_item.update(params.require(:equipment).permit(:name, :inv_nr, :description))
        format.html { redirect_to equipment_path, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @labor_item = Equipment.find(params[:id])
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

end
