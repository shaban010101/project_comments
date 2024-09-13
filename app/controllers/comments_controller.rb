class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params.merge!(project_id: project_params))
    if @comment.persisted?
      flash[:notice] = "Comment saved"
      redirect_to project_path(project_params)
    else
      flash[:error] = @comment.errors.full_messages
      render status: :unprocessable_content, layout: false
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commentor)
  end

  def project_params
    params.require(:project_id)
  end
end
