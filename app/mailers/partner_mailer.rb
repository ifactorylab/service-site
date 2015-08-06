class PartnerMailer < ApplicationMailer
  default from: "ifactory.lab@gmail.com"

  def booking_request_email(booking)
    @booking = booking
    @url = "web-admin.herokuapp.com"
    @people_unit = unit_for_people(booking)
    mail(to: @booking.site.business.email, subject: "You have a booking request")
  end

  private

  def unit_for_people(booking)
    @booking.number_of_person > 1 ? "people" : "person"
  end
end
