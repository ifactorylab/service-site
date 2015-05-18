class StylesController < ApplicationController
  before_action :authorize_partner
  before_action :set_style, :only => [:update, :upload]

  def index
    style = Style.where(site_id: params[:id]).first
    render json: { style: style }, status: 200
  end

  # curl -v -XPUT -F "file=@/Users/minkim/Desktop/download.jpeg" "http://localhost:3000/styles/c5afc3fc-9ab7-4191-a7f9-e735f4132aab/logo"
  def upload
    @style.logo = params[:file]
    @style.save!
  end

  def update
    @style.update!(update_params)
    render nothing: true, status: 200
  end

  private

  def set_style
    @style ||= Style.find(params[:id])
  end

  def update_params
    hash = params.require(:style)
      .permit(:title, :header_background_color, :header_title_color,
        :footer_background_color, :footer_title_color)
    hash.each_value { |value| value.squish! if value.kind_of? String }
    hash
  end
end
