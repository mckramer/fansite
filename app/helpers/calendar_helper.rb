module CalendarHelper

  def prev_month_link(current_month, html_options = {})
    prev_month = current_month.prev_month
    format = "%B"
    format << " %Y" if current_month.year != prev_month.year
    link_to "&laquo; #{l prev_month, format: format}".html_safe, month_path(prev_month), html_options
  end
  
   def next_month_link(current_month, html_options = {})
    next_month = current_month.next_month
    format = "%B"
    format << " %Y" if current_month.year != next_month.year
    link_to "#{l next_month, format: format} &raquo;".html_safe, month_path(next_month), html_options
  end
  
  def month_path(month_date)
    "#{calendar_path}/#{month_date.year}/#{month_date.month}"
  end
  
  def event_link( event, html_options={} )
    link_text = event.category.humanize
    unless event.all_day?
      if event.start_at.strftime("%M").to_i == 0
        format = "%l%P"
      else 
        format = "%l:%M%P"
      end
      link_text = event.start_at.strftime(format) + " " + link_text
    end
    link_to link_text, event, {rel: 'popover', data: {content: event.teaser, 'original-title' => event.name}}
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>",
      :use_all_day => true
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event, day = args[:event], args[:day]
      html = %(<a href="/events/#{event.id}" title="#{h(event.name)}">)
      html << display_event_time(event, day)
      html << %(#{h(event.name)}</a>)
      html
    end
  end
end
