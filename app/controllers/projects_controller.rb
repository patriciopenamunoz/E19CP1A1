class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @project = Project.new
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

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
