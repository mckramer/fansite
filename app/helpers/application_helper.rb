module ApplicationHelper
  
  # Get gravatar image for user
  def gravatar_for user, size=80, options={}
    options[:alt] = "Avatar for #{user.username}" unless options.has_key?(:alt)
    options[:class] = "avatar" unless options.has_key?(:class)
    id = Digest::MD5::hexdigest user.email.strip.downcase
    url = 'http://www.gravatar.com/avatar/' + id + '.jpg?s=' + size.to_s + '&d=wavatar'
    image_tag url, options
  end

  
  def authentication_image_for(auth)
    image_tag "icons/social/64/#{auth.provider}.png"
  end
  
end
