class ProjectsController < ApplicationController
  layout "application"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, labor_staff: :all


  def index
    @projects = Project.all
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
                                    :description
                                    )

  end

end
