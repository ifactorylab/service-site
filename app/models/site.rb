class Site < ActiveRecord::Base
  has_one :business
  has_one :style
  has_many :bookings
  has_many :emails

  APP_SERVER = "app.ur-bazaar.com".freeze

  state_machine :status, :initial => :development do
    event :create do
      transition :development => :created
    end
  end

  before_save do
    self.app_url = "http://#{APP_SERVER}/#!#{self.id}"
    if self.domain
      # self.domain.gsub!("http://", "")
      self.domain = self.domain[0...-1] if self.domain[-1, 1] == "/"
    else
      self.domain = self.app_url
    end
  end

  after_save :update_app_url

  def update_app_url
    self.update_column(:app_url, "http://#{APP_SERVER}/#!#{self.id}")
    # self.update_column(:domain, "http://web-app-angular.herokuapp.com/#/#{self.id}")

    Style.create!(:title => self.name, :site_id => self.id) unless self.style
  end

  def to_h
    self.attributes.merge({ business: business.to_h })
  end
end
