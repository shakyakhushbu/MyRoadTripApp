class BookingMailer < ApplicationMailer
  # default from: 'shakyakhushbu02@gmail.com'
   

  def new_booking_email
    byebug
    @booking = params[:booking]
    # @email = @current_user.email
    mail(to: 'test1@yopmail.com', subject: "Your Booking is confirmed!")
  end

end
