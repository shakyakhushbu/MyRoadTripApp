class TripsController < ApplicationController
  def index  
    @trip = if params[:start_date].blank? && params[:end_date].blank? && params[:search].blank? 
              byebug
              redirect_to root_path
              @trip = Trip.all
            elsif
              byebug
              @a = Destination.all.find_by(city_name: params[:search])
              @a.trips
            elsif
              byebug
              @b = Trip.all.find_by(start_date: params[:start_date])
              @c = Trip.all.find_by(end_date: params[:end_date]) 
            end
  end
  def show 
    @trip = Trip.find(params[:id])
  end
  def new
    @trip = Trip.new
  end

  def create
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
    # byebug
    # if current_user.admin?
    #   @trip = Trip.all
    # else
    # redirect_to trips_path(:search => params[:search])
    # redirect_to trips_path(:search => params[:search])
    redirect_to trips_path(start_date: params[:start_date], end_date: params[:end_date], search: params[:search])
    # end
    # redirect_to root_path
    # render :root_path, search: params[:search]
  end



  private
  def trip_params
    params.require(:trip).permit(:trip_type, :trip_name, :amount, :start_date, :end_date, :main_image, destination_id: [])
  end
end
