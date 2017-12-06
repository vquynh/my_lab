class ProjectsController < ApplicationController
  layout "application"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, labor_staff: :all


  def index
    @projects = Project.where.not(id: 1)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
    last_booked_items_ids = Booking.joins(:booking_items).select(:equipment_id).where("project_id = ?", params[:id])
    @usually_booked_items = Equipment.where('id IN (?)', last_booked_items_ids).last(3)
  end

  def destroy
    # Look up
    @project = Project.find(params[:id])

    # Destroy/Delete the record
    @project.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to project_url, notice: 'Project was removed.' }
    end
  end

  private
  def project_params
    params.require(:project).permit(:name,
                                    :description,
                                    :main_image,
                                    :thumb_image
                                   )

  end

end
