module UsersHelper

  def profile_image_url(user)
    unless user.authentications.empty?
      # Iterate through and assign the 
      user.authentications.each do |auth|
        case auth.provider
          when :facebook then url = "https://graph.facebook.com/#{auth.uid}/picture"
          when :twitter then url ||= "https://api.twitter.com/1/users/profile_image/#{auth.uid}"
        end
      end
    end
    url || "http://placehold.it/200x200"
  end

end
