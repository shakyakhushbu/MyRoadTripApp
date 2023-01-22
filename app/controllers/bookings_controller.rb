class BookingsController < ApplicationController
  # before_action :authenticate_user!, except: [:index], notice: 'you must sign in first!'
  # before_action :authenticate_user!
  def index
    # byebug
    @booking = Booking.all
    @user = current_user
  end
  def show
    # @booking = Booking.find(params[:id])
  end
  def new
    # byebug

    # @trip = Trip.find_by_id(params[:trip_id])

    @booking = Booking.new
    
  end
  def create
    byebug

    

    @booking = Booking.new(params_booking)
    @trip = Trip.find_by_id(params[:trip_id])
   byebug
    
    current_user.bookings.create(trip_id: params[:trip_id], user_name: params[:booking][:user_name], contact_detail: params[:booking][:contact_detail])
    flash[:notice] = "Thank You!! Your Booking is confirmed"
    redirect_to root_path
    byebug
    
  end
  def display 
    # @user = User.last
    # @booking = Booking.last
    # @trip = Trip.last
    # byebug
    # @trip = Trip.find_by_id(params[:trip_id])
    
  end
  private 
  def params_booking
    params.require(:booking).permit(:user_name, :contact_detail, :trip_id, :user_id) 
  end
end
