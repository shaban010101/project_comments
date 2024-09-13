class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @comments = @project.comments.order(created_at: :desc)
  end
end
