class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.scoped
    if params[:category] 
      if Event::CATEGORY_OPTIONS.include?(params[:category])
        @events = @events.where(category: params[:category])
      else
        # TODO: i18n
        flash[:error] = "Invalid category specified. Instead we are showing all events."
      end
    end
  
    # Featured event
    @event = Event.upcoming.first
    
    @today = Date.today
    @shown_month = @today
    @events = @events.where(:start_at => @today.beginning_of_month..@today.end_of_month)
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

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @locations = event_locations

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @locations = Location.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.teaser = params[:event][:description] if params[:event][:teaser].nil? || params[:event][:teaser].blank?

    respond_to do |format|
      if @event.save
        format.html { 
          flash[:success] = 'Event was successfully created.'
          redirect_to @event
        }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { 
          @locations = event_locations
          render action: "new" 
        }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { 
          flash[:success] = 'Event was successfully updated.'
          redirect_to @event
        }
        format.json { head :ok }
      else
        format.html { 
          @locations = event_locations
          render action: "edit" 
        }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def event_locations
    Location.all
  end
end
