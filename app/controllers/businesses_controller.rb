class BusinessesController < ApplicationController
  before_action :authorize_partner

  def index
    business = Business.where(site_id: params[:id]).first
    render json: { business: business }, status: 200
  end

  def create
    business = Business.create!(create_params)
    render json: { business: { id: business.id } }, status: 201
  end

  private

  def create_params
    hash = params.require(:business)
      .permit(:phone, :email, :name, :address, :city, :state, :postcode, :country)
    hash.each_value { |value| value.squish! if value.kind_of? String }
    hash.merge!({ site_id: params[:id] })
  end

end
