class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index], notice: 'you must sign in first!'
  def index
    @booking = Booking.all
  end
  def show
    @booking = Booking.find(params[:id])
  end
  def new
    @booking = Booking.new 
  end
  def create
    @trip = Trip.last
    @user = User.last
    @booking = Booking.new(params_booking)
    @trip.booking.create(user_id: @user.id, user_name: params[:booking][:user_name], contact_detail: params[:booking][:contact_detail])
    flash[:notice] = "Thank You!! Your Booking is confirmed"
    # redirect_to root_path
      
    redirect_to bookings_path
    # if @booking.save 
    #   # byebug
    #   redirect_to @booking
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end
  private 
  def params_booking
    params.require(:booking).permit(:user_name, :contact_detail, :trip_id, :user_id) 
  end
end
