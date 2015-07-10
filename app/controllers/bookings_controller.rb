class BookingsController < ApplicationController
  before_action :set_site, :only => [:create]
  before_action :set_booking, :only => [:confirm, :reject]

  # curl -v -XPOST -H 'content-type: application/json' localhost:3000/sites/39d77ca1-319d-4b35-880f-3c918aa0f8f1/booking -d'{"booking":{"date":"2015-07-10", "first_name":"Min", "last_name":"Kim", "email":"minsikzzang@gmail.com","phone_number":"07565428714"}}'
  def create
    booking = Booking.create(create_params)

    # Send email to partner to notify
    PartnerMailer.booking_request_email(booking).deliver_now
    render json: { booking: { id: booking.id } }, status: 201
  end

  # curl -v -XPATCH -H 'content-type: application/json' localhost:3000/booking/86b25fe5-e0ee-484a-9280-df8706b4e2c2/confirm -d'{}'
  def confirm
    @booking.confirm
  end

  # curl -v -XPATCH -H 'content-type: application/json' localhost:3000/booking/86b25fe5-e0ee-484a-9280-df8706b4e2c2/reject -d'{}'
  def reject
    @booking.reject
  end

  def update
  end

  private

  def set_site
    @site ||= Site.find(params[:id])
  end

  def set_booking
    @booking ||= Booking.find(params[:id])
  end

  def create_params
    hash = params.require(:booking).permit(:date, :time, :number_of_person,
      :first_name, :last_name, :email, :phone_number)
    hash.each_value { |value| value.squish! if value.kind_of? String }
    hash.merge!(params.require(:booking).permit(:note))
    hash.merge!({ site_id: @site.id })
  end
end
