class Business < ActiveRecord::Base
  belongs_to :site
  has_many :hours

  def to_h
    self.attributes.merge({ hours: to_hash(hours) })
  end

  def to_hash(hours)
    hash = {}
    hours.each do |hour|
      if hash[hour.day]
        hash[hour.day] = [hash[hour.day], hour.text].join(", ")
      else
        hash[hour.day] = hour.text
      end
    end
    hash
  end
end
