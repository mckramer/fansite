# -- Attributes --
# name, string
# description, text
# type, string => image, music, video, music-video
# belongs_to media_provider
# provider_media_id, string
# source_url, string
# 
# content_url, string
# * tags, references => people_list, location_list
# captions, text => except for image
# analysis, text => most likely not needed for image
# recorded_on, date => when picture was taken, when song was recorded, when video was filmed
# released_on, date
# * has_many :download_links, :class_name => 'Link'

class Medium < ActiveRecord::Base

  belongs_to :provider, :class_name => "MediaProvider", :foreign_key => "media_provider_id"
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :form
  validates_presence_of :provider
  validate :validates_presence_of_urls
  
  def self.form_options
    return %w[image music video]
  end
  
  def self.provider_options
    return %w[youtube imggur photobucket itunes amazon twitter]
  end
  
  def self.random(sample_size = 3)
    if count == 0
      nil
    elsif count < sample_size
      order("updated_at DESC").limit(count).sample
    else
      order("updated_at DESC").limit(sample_size).sample
    end
  end
  
  private
  
  def validates_presence_of_urls
    if self.provider_media_id.blank?
      if self.source_url.blank? || self.thumbnail_url.blank? || self.content_url.blank?
        false
      else
        true
      end
    else
      true
    end
  end
  
end
