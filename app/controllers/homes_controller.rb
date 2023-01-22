class HomesController < ApplicationController
  def index
    @trip = Trip.all
  end
  def show 
    @trip = Trip.find(params[:id])
  end
end