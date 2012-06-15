class AuthenticationsController < ApplicationController

  def create
    # Retrieve hash from request
    omniauth = request.env["omniauth.auth"]
    
    # Determine if authentication has already been used
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    
    if authentication
      
      # Authentication has already been setup for the user.
      flash[:success] = t('notice.signed_in')
      sign_in(authentication.user)
      redirect_to request.env["omniauth.origin"] || root_path
      
    elsif current_user
      
      # User has already logged in, but authentication is new
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:success] = t('notice.new_authentication')
      redirect_to request.env["omniauth.origin"] || authentications_path
      
    else
      
      # User is not logged in and authentication is new. Build new user and sign in.
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:success] = t('notice.new_user')
        sign_in(user)
        redirect_to request.env["omniauth.origin"] || authentications_path
      else
        session[:omniauth] = omniauth.except(:extra)
        # how to deal with sign in here
        redirect_to controller: 'registrations', action: 'new'
      end
      
    end
  end
  
  def destroy
    sign_out()
    flash[:success] = t('notice.signed_out')
    redirect_to root_path
  end
  
  def failed
    @message = params[:message]
    respond_to do |format|
      format.html { render :layout => 'display' }
      format.json { render json: @message, status: :unprocessable_entity }
    end
  end
  
  private
  
  def sign_in(user)
    session[:user_id] = user.id
  end
  
  def sign_out()
    session[:user_id] = nil
  end

end
