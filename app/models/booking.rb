class Booking < ActiveRecord::Base
  belongs_to :site

  state_machine :status, :initial => :requested do
    event :confirm do
      transition :requested => :confirmed
    end

    event :reject do
      transition :requested => :rejected
    end
  end

end
