class PartnerMailer < ApplicationMailer
  default from: "ifactory.lab@gmail.com"

  def booking_request_email(booking)
    @booking = booking
    @url = "web-admin.herokuapp.com"
    mail(to: @booking.site.business.email, subject: "You have a booking request")
  end

end
