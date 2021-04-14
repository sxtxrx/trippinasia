class CommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]
      
  
  
    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to prototype_path(@comment.prototype)
      else
        @prototype = @comment.prototype
        @comments = @prototype.comments
        render "prototypes/show"
      end
    end


    def destroy
      if@comment.destroy
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
      unless @comment
        redirect_to root_url
      end
    end
  end