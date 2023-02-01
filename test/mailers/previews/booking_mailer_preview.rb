# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview
 def new_booking_email
   @booking = Booking.new(contact_detail: 1234567890)
   BookingMailer.with(booking: @booking).new_booking_email
  end
end
