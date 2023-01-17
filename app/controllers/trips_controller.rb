class TripsController < ApplicationController
  def index 
    @trip = Trip.all
  end
  def show 
    @trip = Trip.find(params[:id])
  end
  def new
    @trip = Trip.new
  end

  def create
    # a.destination_trips.create(trip_id: 24)
    # params[:trip]
    # params[:trip][:id]
    @trip = Trip.new(trip_params)
    if @trip.save
    byebug
      # @b = Destination.find(params[:destination_id])
      @trip.destination_trips.create(destination_id: params[:destination])

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
  private
  def trip_params
    params.require(:trip).permit(:trip_type, :trip_name, :amount, :start_date, :end_date, :destination_id)
  end
end
