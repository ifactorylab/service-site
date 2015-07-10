class PartnerMailer < ApplicationMailer
  default from: "ifactory.lab@gmail.com"

  def booking_request_email(booking)
    @booking = booking
    mail(to: @booking.email, subject: "You've got booking request")
  end

end
