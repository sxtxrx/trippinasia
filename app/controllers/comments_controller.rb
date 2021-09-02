class CommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def new
    @comment = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    else
      render :new
    end
  end

  def destroy
    if @comment.destroy
      redirect_to prototype_path(@comment.prototype_id)
    else
      redirect_to prototype_path(@comment.prototype)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url unless @comment
  end
end
