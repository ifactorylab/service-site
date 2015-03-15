class Site < ActiveRecord::Base
  STATUS_DEVELOPMENT = 0
  STATUS_LIVE = 5

  has_one :business

  before_save do
    self.app_url = "apps.venice.com/#{partner_id}/#{name.downcase.gsub(' ','')}"
    if self.domain
      self.domain.gsub!("http://", "")
      self.domain = self.domain[0...-1] if self.domain[-1, 1] == "/"
    else
      self.domain = self.app_url
    end
  end

  def to_h
    self.attributes.merge({ business: business.to_h })
  end
end
