# -- Attributes --
# name, string
# description, text
# form, string => image, music, video
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
  
  attr_accessible :name, :description, :form, :provider, :captions, :analysis, :source_url
  
  # Validations
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :form
  validates_presence_of :provider
  validate :validates_presence_of_urls
  
  ##
  # Form options
  #
  def self.form_options
    I18n.t('media.types')
  end
  
  ##
  # Retrieve random medium
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
  
  ##
  # Validates presence of URLs for the media
  def validates_presence_of_urls
    if provider_media_id.blank?
      !( source_url.blank? || thumbnail_url.blank? || content_url.blank? )
    else
      true
    end
  end
  
end
