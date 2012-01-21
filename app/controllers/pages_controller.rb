class PagesController < ApplicationController

  def home
    @media = Medium.last
    @post = Post.last
    @event = Event.last
    
    render :layout => 'display'
  end
  
  def about
  
  end
  
  def contact
  
  end
  
  def updates
    @posts = Post.all
    @events = Event.all
    @concerts = Event.where(:category => "concert")
  end

end