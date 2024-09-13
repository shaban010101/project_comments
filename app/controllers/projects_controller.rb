class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @comments = @project.comments.order(created_at: :desc)
    @histories = @project.project_histories.order(created_at: :desc)
  end
end
