class PagesController < ApplicationController

  def home
    @media = Medium.random
    @post = Post.last
    @event = Event.random
    
    render :layout => 'display'
  end
  
  def about
  
  end
  
  def contact
  
  end
  
  def updates
    @posts = Post.order('id DESC').limit(5)
    @today = Date.today
    @events = Event.upcoming
    @concerts = Event.upcoming.where(:category => "concert")
  end
  
  def locales
    @locales = I18n.available_locales
  end
  
  def translations
    
  end

end