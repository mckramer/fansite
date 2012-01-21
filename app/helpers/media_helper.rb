module MediaHelper

  # Generated image tag for specified media type
  def media_type_image_tag(type, size = 32)
    image_tag assests_path("icons/media/#{size}/#{type}.png")
  end
  
  # Generates link to media filtered by type using image
  def link_to_media_by_type_with_image(type, size = 32)
    link_to media_type_image_tag(type, size), media_type_path(type)
  end
  
  # Generates path to index action filtered by type of media
  def media_type_path(type)
    return "#{media_path}/type/#{type}"
  end
  
  def embedded_for(media, height = 385, width = 640)
    if media.provider == 'youtube'
      render 'media/youtube', locals: { video_id: media.provider_media_id,  height: height, width: width }
    end
  end
  
  # Used for embedding media
  def source_url_for(media, height = 300, width = 600)
    url = nil
    if media.source_url
      # There is a custom url
      url = media.source_url
    elsif media.provider
      # Here, the url follows the pattern from the provider
      url = parse_variables_to_url(media.provider.source_url, media.provider_media_id, height, width)
    else
      # Looks like an issue, let's provide a default just in case
      url = "http://placehold.it/#{width}x#{height}"
    end
    url
  end
  
  def thumbnail_for(media, height = 150, width = 185)
    link_to image_tag(thumbnail_url_for(media, height, width)), media, { :class => "thumbnail", :rel => "popover", :data => { :content => media.teaser, "original-title" => media.name, :placement => :below } }
  end
  
  def thumbnail_url_for( media, height = 150, width = 185)
    url = nil
    if media.thumbnail_url.blank? == false
      # There is a custom url
      url = media.thumbnail_url
    elsif media.provider
      # Here, the url follows the pattern from the provider
      url = parse_variables_to_url(media.provider.thumbnail_url, media.provider_media_id, height, width)
    else
      # Looks like an issue, let's provide a default just in case
      url = "http://placehold.it/#{width}x#{height}"
    end
    url
  end
  
  # Used for linking back to website
  def content_url_for(media)
    url = nil
    if media.content_url
      # There is a custom url
      url = media.content_url
    elsif media.provider
      # Here, the url follows the pattern from the provider
      url = parse_variables_to_url(media.provider.content_url, media.provider_media_id)
    else
      # Looks like an issue, let's provide a default just in case
      url = media.provider.homepage_url
    end
    url
  end
  
  private
  # Add
  def parse_variables_to_url(url, id,  height = nil, width = nil)
    url = url.sub(/\[id\]/, id)
    url = url.sub(/\[height\]/, height.to_s) if height
    url = url.sub(/\[width\]/, width.to_s) if width
    url
  end
end
