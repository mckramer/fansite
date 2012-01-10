class AuthenticationsController < ApplicationController

  def create
    # Retrieve hash from request
    omniauth = request.env["omniauth.auth"]
    
    # Determine if authentication has already been used
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    
    if authentication
      
      # Authentication has already been setup for the user.
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
      
      request.env["omniauth.origin"] || root_path
      
    elsif current_user
      
      # User has already logged in, but authentication is new
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      
      redirect_to request.env["omniauth.origin"] || authentications_path
      
    else
      
      # User is not logged in and authentication is new. Build new user and sign in.
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_users_path
      end
      
    end
  end

end
