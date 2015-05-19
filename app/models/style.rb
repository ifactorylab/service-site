class Style < ActiveRecord::Base
  belongs_to :site
  mount_uploader :logo, LogoUploader

  before_save do
    self.header_background_color = "#9edccd" unless self.header_background_color
    self.header_title_color = "#ffffff" unless self.header_title_color
    self.footer_background_color = "#9edccd" unless self.footer_background_color
    self.footer_title_color = "#ffffff" unless self.footer_title_color
  end

  def to_h
    self.attributes.merge({
      logo: {
        small_url: logo.small.url,
        url: logo.url
      }
    })
  end
end
