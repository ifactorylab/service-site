class Business < ActiveRecord::Base
  belongs_to :site
  has_many :hours

  def to_h
    self.attributes.merge({ hours: Hour.to_day_h(hours) })
  end

end
