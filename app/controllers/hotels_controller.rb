class HotelsController < ApplicationController
  # def index
  #   @hotel = Hotel.all
  # end
  # def show

  #   @hotel = Hotel.find(params[:id])
  # end
  # def new
  #   @trip = Hotel.new
  # end
  # def create
  #   @hotel = Hotel.new(hotel_params)
  #  if @hotel.save
  #   # byebug
  #   @hotel.create_hotel(destination_id: params[:Destination])
  #   redirect_to trips_path
  #  else
  #   render :index, status: :unprocessable_entity
  #  end
  # end
  # def edit
  #   @hotel = Hotel.find(params[:id])
  # end
  # def update
  #   @hotel = Hotel.find(params[:id])
  #   if @hotel.update(hotel_params)
  #     redirect_to hotels_path
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end 
  # end
  # def destroy
  #   @hotel = Hotel.find(params[:id])
  #   @hotel.destroy

  #   redirect_to hotels_path, status: :see_other
  # end
  # private  
  # def hotels_params
  #   params.require(:hotel).permit(:hotel_name)
  # end
end
