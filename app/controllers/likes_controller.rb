class LikesController < ApplicationController
  def create
    gossip_id()
    Like.create(gossip_id:gossip_id(),user_id:session[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def delete
    Like.where(gossip_id:gossip_id(), user_id:session[:user_id]).first.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def gossip_id
    params[:gossip][:id]
  end
end

