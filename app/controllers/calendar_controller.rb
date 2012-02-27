class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @today = Date.today
    @shown_month = Date.civil(@year, @month)
    @events = Event.where(:start_at => @shown_month.beginning_of_month..@shown_month.end_of_month)
    @events_for_month = Hash.new
    @events.each do |event|
      @events_for_month[event.start_at.day] ||= Array.new
      @events_for_month[event.start_at.day] << event
      if event.all_day? && event.start_at.day != event.end_at.day
        length_of_event = (event.end_at - event.start_at).to_i / 1.day
        length_of_event.times do |index|
          @events_for_month[event.start_at.day + index + 1] ||= Array.new
          @events_for_month[event.start_at.day + index + 1] << event
        end
      end
    end
  end
  
end
