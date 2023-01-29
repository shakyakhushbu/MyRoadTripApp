class DestinationsController < ApplicationController
  def index 
    @destination = Destination.all
  end
  def show 
    @destination = Destination.find(params[:id])
  end
  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      # byebug
      @destination.create_hotel(hotel_name: params[:hotel][:hotel_name])
      redirect_to destinations_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])

    if @destination.update(destination_params)
      redirect_to destinations_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy

    redirect_to destinations_path, status: :see_other
  end
  private
  def destination_params
    params.require(:destination).permit(:city_name, :state_name)
  end

end
