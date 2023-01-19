# class HomesController < ApplicationController
#   def index
#     @home = Home.all
#   end
#   def show 
#     @home = Home.find(params[:id])
#   end
#   def edit 
#   end
#   def new 
#     @home = Home.new
#   end
#   def create 
#     @home = Home.create
#   end
# end


class HomesController < ApplicationController
  def index
    @trip = Trip.all
  end
  def show 
    @trip = Trip.find(params[:id])
  end
end