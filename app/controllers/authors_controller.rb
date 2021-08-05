class AuthorsController < ApplicationController
  def index
    @all_user = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @city = City.find(@user.city_id)
  end
end
