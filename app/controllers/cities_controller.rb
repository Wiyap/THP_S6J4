class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @gossips = Gossip.new
  end
end
