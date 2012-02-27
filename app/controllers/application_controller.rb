class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_user_language
  before_filter :set_user_time_zone
  helper_method :current_user
  helper_method :logged_in?
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
  
  private  
  def current_user  
    @current_user ||= User.find(session[:user_id]) if logged_in?  
  end
  
  def logged_in?
    true if session[:user_id]
  end

  def set_user_language
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash[:warning] = 'Sorry, but that locale is not supported.'
      end
    else
      I18n.locale = current_user.locale if logged_in? && current_user.locale.blank? == false
    end
  end
  
  def set_user_time_zone
    Time.zone = current_user.time_zone if logged_in?
    Time.zone = "Eastern Time (US & Canada)"
    #Time.zone = "UTC"
  end
end
