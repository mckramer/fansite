module EventsHelper

  def events_by_category_path(category)
    "#{events_path}/category/#{category}"
  end

  def link_to_events_by_category(category)
    link_to t("events.category.#{category}"), events_by_category_path(category)
  end

end
