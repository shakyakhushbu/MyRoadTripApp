class BookingMailer < ApplicationMailer
  default from: 'shakyakhushbu02@gmail.com'

  def new_booking_email
    @booking = params[:booking]

    mail(to: 'khushiiii2704@gmail.com', subject: "Your Booking is confirmed!")
  end
end
