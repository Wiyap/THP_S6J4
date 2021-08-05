class CommentsController < ApplicationController
  def create
    @comment = Comment.new(content: params[:comment][:content], user_id: session[:user_id], gossip_id: params[:comment][:id])
    if @comment.save
      redirect_to gossip_path(@comment.gossip_id)
    else
      redirect_to gossip_path(@comment.gossip_id)
    end
  end

  def edit
    @comments = Comment.new
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content:params[:comment][:content])
      redirect_to gossip_path(@comment.gossip_id)
    else
      render :edit
    end
  end

  def destroy
    gossip_id = Comment.find(params[:id]).gossip_id
    Comment.destroy(params[:id])
    redirect_to gossip_path(gossip_id)
  end
end
