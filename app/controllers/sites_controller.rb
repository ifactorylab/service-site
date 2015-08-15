class SitesController < ApplicationController
  before_action :authorize_partner
  before_action :set_site, :only => [:update]

  # curl -v -XGET localhost:3000/sites -H 'Venice-Authorization: cee3eb61-2435-4a28-b422-9ebfacc8dbec'
  def index
    if GemAuth.current_user.id == "491bbd3e-5aef-4932-8898-3bea023a729f"
      sites = Site.all
    else
      sites = Site.where(partner_id: GemAuth.current_user.id)
    end
    render json: { sites: sites }, status: 200
  end

  # curl -v -XPOST localhost:3000/sites -H 'Venice-Authorization: cee3eb61-2435-4a28-b422-9ebfacc8dbec' -H "Content-Type: application/json"  -d'{"site":{"name":"Ichiriki","layout_id":"tetsts"}}'
  def create
    # GemAuth.current_user
    site = Site.create!(create_params)
    render json: { site: { id: site.id } }, status: 201
  end

  # curl -v -XGET localhost:3000/sites/6e95b317-26bf-4c96-8e00-cefdb9967a75 -H 'Venice-Authorization: cee3eb61-2435-4a28-b422-9ebfacc8dbec'
  def show
    site = Site.includes(:business).find(params[:id])
    render json: { site: site.to_h }, status: 200
  end

  def update
    @site.update!(update_params)
    render nothing: true, status: 200
  end

  private

  def set_site
    @site ||= Site.find(params[:id])
  end

  def create_params
    hash = params.require(:site).permit(:name, :domain, :ga_tracking_id, :keywords)
    hash.each_value { |value| value.squish! if value.kind_of? String }
    hash.merge!(params.require(:site).permit(:description))
    hash.merge!({ partner_id: GemAuth.current_user.id })
  end

  def update_params
    hash = params.require(:site).permit(:name, :domain, :ga_tracking_id, :keywords)
    hash.each_value { |value| value.squish! if value.kind_of? String }
    hash.merge!(params.require(:site).permit(:description))
    hash.merge!({ partner_id: GemAuth.current_user.id })
  end
end
