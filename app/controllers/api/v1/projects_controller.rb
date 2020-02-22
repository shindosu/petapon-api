class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all.order(:title)
  end

  def show
    render json: @project
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: {status: "Project created!", data: @project}
    else
      render_error
    end
  end

  def update
    if @project.update(project_params)
      render json: {status: "Project updated!", data: @project}
    else
      render_error
    end
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :user_id)
  end

  def render_error
    render json: {error: @project.errors}, status: :unprocessable_entity
  end
end