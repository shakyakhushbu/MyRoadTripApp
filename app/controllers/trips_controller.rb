class TripsController < ApplicationController
before_action :authenticate_user!, except: :index, notice: 'you must sign in first!'

  
  def index 
    @trip = Trip.all
    byebug
    if !params[:search].blank?
      @trip = @trip.joins(:destinations).where(destinations: { city_name: params[:search] })
    end

    if !params[:trip_type].blank?
      @trip = @trip.where(trip_type: params[:trip_type])
    end 

    if !params[:start_date].blank? && !params[:end_date].blank?
      @trip = @trip.where("start_date >= :start_date AND end_date <= :end_date",
      {start_date: params[:start_date], end_date: params[:end_date]})
    end 

    if !params[:min].blank? && !params[:max].blank?
      @trip = @trip.where('amount >= ? AND amount <= ?', params[:min], params[:max])
    end 

    if !params[:start_date].blank? && !params[:end_date].blank?
      @trip = @trip.where("start_date >= ? AND end_date <= ?", params[:start_date], params[:end_date]) 
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
      redirect_to root_path
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
    # if params[:start_date].blank? && params[:end_date].blank? && params[:search].blank? && params[:trip_type].blank? && params[:min].blank? && params[:max].blank?
    # redirect_to root_path
    # else
    # byebug
    redirect_to trips_path(start_date: params[:start_date], end_date: params[:end_date], search: params[:search], trip_type: params[:trip_type], min: params[:min], max: params[:max])
    # end
  end



  private
  def trip_params
    params.require(:trip).permit(:trip_type, :trip_name, :amount, :start_date, :end_date, :main_image, destination_id: [])
  end
end
