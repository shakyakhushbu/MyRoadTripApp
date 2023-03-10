class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.all
  end
  def show
    @booking = Booking.find(params[:id])
  end
  def new
    @booking = Booking.new
  end
  def create
    # @booking = Booking.new(params_booking)
    @trip = Trip.find_by_id(params[:trip_id])
    # byebug
    
    # if @booking.save
    @booking = current_user.bookings.create(trip_id: params[:trip_id], user_name: params[:booking][:user_name], contact_detail: params[:booking][:contact_detail])
      if @booking.save 
        BookingMailer.with(booking: @booking).new_booking_email.deliver_now
        flash[:notice] = "Thank You!! Your Booking is confirmed"
        redirect_to root_path
      end


    #   current_user.bookings.create(trip_id: params[:trip_id], user_name: params[:booking][:user_name], contact_detail: params[:booking][:contact_detail])
    # if @booking.save
    #   BookingMailer.with(booking: @booking).new_booking_email.deliver_later
    #   flash[:notice] = "Thank You!! Your Booking is confirmed"
    #   redirect_to root_path
    # else
    #   render :new
    # end
    
  end
  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(params_booking)
      redirect_to bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path, status: :see_other
  end
 
  private 
 
  def params_booking
    params.require(:booking).permit(:user_name, :contact_detail, :trip_id, :user_id) 
  end
end
