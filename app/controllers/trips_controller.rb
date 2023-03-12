class TripsController < ApplicationController
  def index 
    @trip = Trip.all
    filter_trips(params)
    # if @trip.present?
    #   respond_to do |format|
    #     format.json { render json: @trip, each_serializer: TripSerializer }
    #     format.html { render :index }
    #   end
    # else
    #   render json: {message: 'Trip Not Found'}, status: 404
    # end
  end

  def show 
    @trip = Trip.find_by(id: params[:id])
    if @trip.present?
      respond_to do |format|
      format.json { render :json => @trip }
      format.html { render :show }
      end
    else  
      render json: {message: 'Trip Not Found'}, status: 404
    end
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
    redirect_to trips_path(start_date: params[:start_date], end_date: params[:end_date], search: params[:search], trip_type: params[:trip_type], min: params[:min], max: params[:max])
  end

  private

  def trip_params
    params.require(:trip).permit(:trip_type, :trip_name, :amount, :start_date, :end_date, :main_image, destination_id: [])
  end

  def filter_trips(params)
    @trip = @trip.joins(:destinations).where(destinations: { city_name: params[:search] }) if !params[:search].blank?
    # @trip = @trip.where(trip_type: params[:trip_type]) if !params[:trip_type].blank?
    # @trip = @trip.where("start_date >= :start_date AND end_date <= :end_date",
    #   {start_date: params[:start_date], end_date: params[:end_date]}) if !params[:start_date].blank? && !params[:end_date].blank?
    # @trip = @trip.where('amount >= ? AND amount <= ?', params[:min], params[:max]) if !params[:min].blank? && !params[:max].blank?
    # @trip = @trip.where("start_date >= ? AND end_date <= ?", params[:start_date], params[:end_date]) if !params[:start_date].blank? && !params[:end_date].blank?
    @trip = @trip.filter_by_trip_type(params[:trip_type]) if !params[:trip_type].blank?
    @trip = @trip.filter_by_amount(params[:min], params[:max]) if !params[:min].blank? && !params[:max].blank?
    @trip = @trip.filter_by_start_and_end_date(params[:start_date], params[:end_date]) if !params[:start_date].blank? && !params[:end_date].blank?
  end
end
