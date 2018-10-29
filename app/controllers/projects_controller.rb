class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.new
    if @project.update(project_params)
      redirect_to project_path(@project.id), notice: 'Project updated.'
    else
      redirect_to edit_project_path, alert: 'Error detected: Project not updated.'
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project.id), notice: 'Project added.'
    else
      redirect_to new_project_path, alert: 'Error detected: Project not added.'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    if Project.delete(params[:id])
      redirect_to projects_path, notice: 'Project removed.'
    else
      redirect_to projects_path, alert: 'Error detected: Project not removed.'
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
