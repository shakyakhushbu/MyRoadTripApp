class BookingsController < ApplicationController
  before_action :authenticate_user!
  # has_secure_token :booking_token
  def index
    @booking = Booking.all
    @user = current_user
  end
  def show
    # @booking = Booking.find(params[:id])
  end
  def new
    @booking = Booking.new
  end
  def create
    @booking = Booking.new(params_booking)
    @trip = Trip.find_by_id(params[:trip_id])
    byebug
    
    current_user.bookings.create(trip_id: params[:trip_id], user_name: params[:booking][:user_name], contact_detail: params[:booking][:contact_detail])
    flash[:notice] = "Thank You!! Your Booking is confirmed"
    byebug
    @booking
    redirect_to root_path
    
  end
 
  private 
 
  def params_booking
    params.require(:booking).permit(:user_name, :contact_detail, :trip_id, :user_id) 
  end
end
