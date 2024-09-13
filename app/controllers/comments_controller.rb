class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params.merge!(project_id: project_id))
    if @comment.persisted?
      flash[:notice] = "Comment saved"

      ProjectHistoryCreator.new(
        project_id,
        "New Comment: comment: #{comment_params[:comment]} commentor: #{comment_params[:commentor]}"
      ).call

      redirect_to project_path(project_id)
    else
      flash[:error] = @comment.errors.full_messages
      render status: :unprocessable_content, layout: false
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commentor)
  end

  def project_id
    params.require(:project_id)
  end
end
