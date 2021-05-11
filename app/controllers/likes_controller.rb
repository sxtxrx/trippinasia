class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prototype

  def create
    user = current_user
    prototype = Prototype.find(params[:prototype_id])
    like = Like.create(user_id: user.id, prototype_id: prototype.id)
    @like_count = Like.where(prototype_id: params[:prototype_id]).count
  end

  def destroy
    user = current_user
    prototype = Prototype.find(params[:prototype_id])
    like = Like.find_by(user_id: user.id, prototype_id: prototype.id)
    like.destroy
    @like_count = Like.where(prototype_id: params[:prototype_id]).count
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
