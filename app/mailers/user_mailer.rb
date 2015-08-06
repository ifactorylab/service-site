class UserMailer < ApplicationMailer
  default from: "ifactory.lab@gmail.com".freeze

  def booking_confirm_email(booking)
    @booking = booking
    @email = Email.find_booking_confirm(booking.site)
    mail(to: @booking.email, from: business_email(booking), subject: "Your booking has been confirmed with #{@booking.site.business.name}")
  end

  def booking_reject_email(booking)
    @booking = booking
    mail(to: @booking.email, from: business_email(booking), subject: "Your booking has been rejected")
  end

  private

  def business_email(booking)
    booking.site.business.email
  end

end
