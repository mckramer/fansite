class Location < ActiveRecord::Base
  
  attr_accessible :address, :latitude, :longitude, :name, :url
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  def name_with_address
    "#{name}: #{address}"
  end
  
end
