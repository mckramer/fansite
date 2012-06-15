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
    
    @post = Post.order('id DESC').limit(5).sample
    @event = Event.upcoming.sample
    
    @events = Event.upcoming
    @updates = Array.new
    @updates = @updates | @posts.to_a
    @updates = @updates | @events.to_a
    @updates.sort! { 
      |x, y|
        if x.respond_to? :start_at
          x_value = x.start_at
        else
          x_value = x.updated_at
        end
        if y.respond_to? :start_at
          y_value = y.start_at
        else
          y_value = y.updated_at
        end
        
        y_value <=> x_value
    }
  end
  
  def locales
    @locales = I18n.available_locales
  end
  
  def translations
    
  end

end