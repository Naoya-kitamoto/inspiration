class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to idea_path(@comment.idea)
    else
      @idea = @comment.idea
      @comments = @idea.comments
      render "ideas/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, idea_id: params[:idea_id])
  end
end
