class AdminsController < ApplicationController
  def index 
    @trip = Trip.all
  end
end
