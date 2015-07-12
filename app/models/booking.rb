class Booking < ActiveRecord::Base
  belongs_to :site

  state_machine :status, :initial => :requested do
    event :confirm do
      transition :requested => :confirmed
    end

    event :reject do
      transition :requested => :rejected
    end

    after_transition any => :confirmed do |booking, transition|
      UserMailer.booking_confirm_email(booking).deliver_now
    end

    after_transition any => :rejected do |booking, transition|
      UserMailer.booking_reject_email(booking).deliver_now
    end
  end

  before_create do
    self.gmt_offset = self.datetime.to_time.gmt_offset;
  end

  after_create do
    # Send email to partner to notify
    PartnerMailer.booking_request_email(self).deliver_now
  end

  def to_str_time
    (self.datetime.to_time.utc + self.gmt_offset).strftime("%B %d %Y %I:%M %p")
  end
end
