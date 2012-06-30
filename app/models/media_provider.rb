class MediaProvider < ActiveRecord::Base

  attr_accessible :name, :source_url, :thumbnail_url, :content_url, :homepage_url
  
  # Validation
  validates_presence_of :name
  validates_presence_of :homepage_url

end
