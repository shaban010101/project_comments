class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @comments = @project.comments.order(created_at: :desc)
    @histories = @project.project_histories.order(created_at: :desc)
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      ProjectHistoryCreator.new(
        params[:id],
        "Project status change to: #{project_params[:status]}"
      ).call

      flash[:notice] = "Project has been updated"
      redirect_to @project
    else
      flash[:error] = @project.errors.full_messages
      render :show
    end
  end

  private

  def project_params
    params.require(:project).permit(:status)
  end
end
