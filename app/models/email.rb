class Email < ActiveRecord::Base
  TYPE_BOOKING_CONFIRM = 1

  belongs_to :site

  def self.find_booking_confirm(site)
    Email.where(site_id: site.id, type: TYPE_BOOKING_CONFIRM).first
  end
end
