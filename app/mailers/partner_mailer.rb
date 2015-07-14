class PartnerMailer < ApplicationMailer
  default from: "ifactory.lab@gmail.com"

  def booking_request_email(booking)
    @booking = booking
    @url = "web-admin.herokuapp.com"
    mail(to: @booking.email, subject: "You've got booking request")
  end

end
