class UserMailer < ApplicationMailer
  default from: "ifactory.lab@gmail.com"

  def booking_confirm_email(booking)
    @booking = booking
    mail(to: @booking.email, subject: "Your booking has been confirmed")
  end

  def booking_reject_email(booking)
    @booking = booking
    mail(to: @booking.email, subject: "Your booking has been rejected")
  end

end
