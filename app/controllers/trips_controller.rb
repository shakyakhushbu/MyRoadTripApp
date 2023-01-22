class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :authenticate_user!, only: [:edit, :destroy, :update]
  # skip_before_action :authenticate_user!
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
    # byebug
    params[:destination_id]
    # @b = params[:destination_id].map(&:to_i)
    @trip = Trip.new(trip_params)
    if @trip.save
      # @trip.update(destination_id: params[:destination_id])
      # @trip.destination_id
      # byebug
      # @trip.destination_trips.create(:destination_id => (params[:destination_id].map(&:to_i)))
      # destination_id: params[:destination_id]
      params[:destination_id].each do |destination_id|
        @trip.destination_trips.create(destination_id: destination_id)
      end if params[:destination_id].any?
      # @trip.destination_trips.create(:destination_id[].push(params[:destination_id]))
      byebug
      redirect_to trips_path
      # @trip.create_home(trip_name: params[:trip][:trip_name],trip_type: params[:trip][:trip_type], main_image: params[:trip][:main_image], amount: params[:trip][:amount], start_date: params[:trip][:start_date], end_date: params[:trip][:end_date], city_name: params[:trip][:city_name])
      

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
    # params.require(:trip).permit(:trip_type, :trip_name, :amount, :start_date, :destination_id, :end_date, :main_image)
    params.require(:trip).permit(:trip_type, :trip_name, :amount, :start_date, :end_date, :main_image, destination_id: [])
  end
  # def home_params
  #   params.require(:home).permit(:trip_type, :trip_name)
  # end
  # def must_be_user
  #   unless current_user && current_user.user?
  #     redirect_to root_path, notice: "Some message"
  #   end
  # end
end
