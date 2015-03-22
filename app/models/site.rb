class Site < ActiveRecord::Base
  has_one :business

  state_machine :status, :initial => :development do
    event :create do
      transition :development => :created
    end
  end

  before_save do
    self.app_url = "apps.venice.com/#{partner_id}/#{name.downcase.gsub(' ','')}"
    if self.domain
      self.domain.gsub!("http://", "")
      self.domain = self.domain[0...-1] if self.domain[-1, 1] == "/"
    else
      self.domain = self.app_url
    end
  end

  after_save :update_app_url

  def update_app_url
    self.update_column(:app_url, "web-app-angular.herokuapp.com/#/#{self.id}")
    self.update_column(:domain, "web-app-angular.herokuapp.com/#/#{self.id}")
  end

  def to_h
    self.attributes.merge({ business: business.to_h })
  end
end
