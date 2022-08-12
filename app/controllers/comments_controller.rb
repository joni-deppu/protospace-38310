class CommentsController < ApplicationController
  def create
    # if comment = Comment.create(comment_params)
    if Comment.create(comment_params)
    redirect_to root_path
    else
      render root_path
    end
  end

  private
  def comment_params
  params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end