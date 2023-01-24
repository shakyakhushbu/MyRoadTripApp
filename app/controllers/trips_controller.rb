class TripsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  def index 
    if params[:search].present?
      render :search
    else
      @trip = Trip.all
    end
    # @trip = Destination.all.find_by(city_name: params[:search])
  end
  def show 
    @trip = Trip.find(params[:id])
  end
  def new
    byebug
    # @trip = Trip.new
    render :search
  end

  def create
    # byebug
    params[:destination_id]
    @trip = Trip.new(trip_params)
    if @trip.save
   
      params[:destination_id].each do |destination_id|
        @trip.destination_trips.create(destination_id: destination_id)
      end if params[:destination_id].any?
      byebug
      redirect_to trips_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update(trip_params)
      redirect_to trips_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_path, status: :see_other
  end
  def search
    if params[:search].blank?
      redirect_to new_trip_path
    else
      redirect_to trips_path(:search => params[:search])
    end
  end

  # def search_filter
  #   byebug
  #   render :search
  # end

  private
  def trip_params
    params.require(:trip).permit(:trip_type, :trip_name, :amount, :start_date, :end_date, :main_image, destination_id: [])
  end
end
