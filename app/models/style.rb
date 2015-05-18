class Style < ActiveRecord::Base
  belongs_to :site

  def to_h
    self.attributes.merge({
      logo: {
        small_url: logo.small.url,
        logo: logo.url
      }
    }).except!("logo")
  end
end
