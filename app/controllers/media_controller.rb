class MediaController < ApplicationController
  
  # GET /media
  # GET /media.json
  def index
    @media = Medium.scoped
    if params[:form] 
      if Medium.form_options.include?(params[:form])
        @media = @media.where(form: params[:form])
      else
        flash[:error] = "Invalid media 'type' specified. Instead we are showing all types of media."
      end
    end
    if params[:year_released]
      # TODO
    end
    if params[:year_recorded]
      #TODO
    end
    
    @current_year = Date.today.year

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media }
    end
  end

  # GET /media/1
  # GET /media/1.json
  def show
    @medium = Medium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium }
    end
  end

  # GET /media/new
  # GET /media/new.json
  def new
    @medium = Medium.new
    @providers = MediaProvider.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium }
    end
  end

  # GET /media/1/edit
  def edit
    @medium = Medium.find(params[:id])
    @providers = MediaProvider.all
  end

  # POST /media
  # POST /media.json
  def create
    @medium = Medium.new(params[:medium])

    respond_to do |format|
      if @medium.save
        format.html { 
          flash[:success] = 'Medium was successfully created.'
          redirect_to @medium
        }
        format.json { render json: @medium, status: :created, location: @medium }
      else
        @providers = MediaProvider.all
        format.html { render action: "new" }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /media/1
  # PUT /media/1.json
  def update
    @medium = Medium.find(params[:id])

    respond_to do |format|
      if @medium.update_attributes(params[:medium])
        format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium = Medium.find(params[:id])
    @medium.destroy

    respond_to do |format|
      format.html { redirect_to media_url }
      format.json { head :ok }
    end
  end
end
