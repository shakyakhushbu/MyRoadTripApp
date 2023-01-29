class TripsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show], notice: 'you must sign in first!'
  
  before_action :authenticate_user!, except: [:index], notice: 'you must sign in first!'

  
  def index  
    @trip = if params[:start_date].blank? && params[:end_date].blank? && params[:search].blank? && params[:trip_type].blank? && params[:min].blank? && params[:max].blank?
              byebug
              redirect_to root_path
              @trip = Trip.all
            # elsif params[:start_date].blank? && params[:end_date].blank? && params[:min].blank? && params[:max] && !params[:search].blank?
            elsif !params[:search].blank?
              byebug
              @a = Destination.all.find_by(city_name: params[:search])
              @b = @a.trips
            elsif !params[:start_date].blank? && !params[:end_date].blank? && params[:search].blank? && params[:min].blank? && params[:max].blank?
              byebug
              @b = Trip.where("start_date >= :start_date AND end_date <= :end_date",
              {start_date: params[:start_date], end_date: params[:end_date]})
            elsif !params[:trip_type].blank? && params[:start_date].blank? && params[:end_date].blank? && params[:min].blank? && params[:max].blank?
              @b = Trip.where(trip_type: params[:trip_type])
            # Trip.where("trip_type: params[:trip_type]  AND params[:min] <= amount >= params[:amount]")
            elsif params[:trip_type].blank? && !params[:min].blank? && !params[:max].blank? && params[:start_date].blank? && params[:end_date].blank?
              byebug
              @b = Trip.where("amount >= ? AND amount <=  ?", params[:min], params[:max])
            elsif !params[:trip_type].blank? && !params[:min].blank? && !params[:max].blank? && params[:start_date].blank? && params[:end].blank?
              byebug
              # @x = params[:min].to_i
              # @y = params[:max].to_i
              # @c = params[:trip_type]
              # @b = Trip.where("trip_type = params[:trip_type] AND amount >= ? AND amount <=  ?", params[:min].to_i, params[:max].to_i)
              # @b = Trip.where("trip_type = 'One Day Trip' AND amount >= ? AND amount <=  ?", 2000, 7000)
              @b = Trip.where("trip_type = ? AND amount >= ? AND amount <=  ?", params[:trip_type], params[:min], params[:max])
            elsif !params[:trip_type].blank? && !params[:min].blank? && !params[:max].blank? && !params[:start_date].blank? && !params[:end_date].blank? 
              byebug
              @b = Trip.where("trip_type = ? AND amount >= ? AND amount <=  ? AND start_date >= ? AND end_date <= ?", params[:trip_type], params[:min], params[:max], params[:start_date], params[:end_date])

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
    byebug
    if params[:start_date].blank? && params[:end_date].blank? && params[:search].blank? && params[:trip_type].blank? && params[:min].blank? && params[:max].blank?
    # if current_user.admin?
    #   @trip = Trip.all
    # else
    # redirect_to trips_path(:search => params[:search])
    # redirect_to trips_path(:search => params[:search])
    redirect_to root_path
    else
    byebug
    redirect_to trips_path(start_date: params[:start_date], end_date: params[:end_date], search: params[:search], trip_type: params[:trip_type], min: params[:min], max: params[:max])
    end
    # redirect_to root_path
    # render :root_path, search: params[:search]
  end



  private
  def trip_params
    params.require(:trip).permit(:trip_type, :trip_name, :amount, :start_date, :end_date, :main_image, destination_id: [])
  end
end
