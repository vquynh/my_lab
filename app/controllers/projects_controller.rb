class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params.require(:Project).permit(:name, :inv_nr, :description))

    respond_to do |format|
      if @project.save
        format.html { redirect_to Project_path, notice: 'Project was successfully added.' }
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
      if @project.update(params.require(:Project).permit(:name, :description))
        format.html { redirect_to Project_path, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    # Look up
    @project = Project.find(params[:id])

    # Destroy/Delete the record
    @project.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to Project_url, notice: 'Project was removed.' }
    end
  end

end
