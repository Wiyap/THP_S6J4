class GossipsController < ApplicationController

  before_action :is_author?, only: [:edit, :update, :destroy]
  before_action :logged_in?, only: [:new, :create, :edit, :update]
  
  def index
    @gossips = Gossip.new
    @all_gossip = Gossip.all
  end

  def show
    @gossips = Gossip.new
    @gossip = Gossip.find(params[:id])
    @comments_new = Comment.new
    @comments = Comment.where(gossip_id:params[:id])
  end

  def new   
    @gossips = Gossip.new
  end

  def create
    @gossip = Gossip.new(title:params[:gossip][:title], content:params[:gossip][:content], user_id:session[:user_id])
    if @gossip.save
      redirect_to gossip_path(@gossip.id)
    else
      render :new
    end
  end

  def edit
    @gossips = Gossip.new
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title:params[:gossip][:title], content:params[:gossip][:content], user_id:@gossip.user_id)
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    Gossip.destroy(params[:id])
    redirect_to gossips_path
  end

  private

  def is_author?
    gossip = Gossip.find(params[:id])
    redirect_to whoops_path unless current_user().id == gossip.user_id
  end

  def params_gossip
    params.require(:gossip).permit(:title,:content).inspect
  end
end