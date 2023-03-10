class BookingMailer < ApplicationMailer
  # default from: 'shakyakhushbu02@gmail.com'
   

  def new_booking_email
    @booking = params[:booking]
    @email = @booking.user.email
    # @email = @current_user.email
    mail(to: 'test1@yopmail.com', subject: "Your Booking is confirmed!")
    # mail(to: @email, subject: "Your Booking is confirmed!")
  end

end
