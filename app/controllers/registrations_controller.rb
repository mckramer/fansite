class RegistrationsController < ApplicationController

  # GET /registrations/new
  # GET /registrations/new.json
  def new
  
  @genders = %w[Unspecified Male Female Other]
  
    if @user
    
    else 
      @omniauth = session[:omniauth]
      if @omniauth
        session[:omniauth] = nil
      else
        yield[:error] = "Error during registration"
        redirect_to root_path
        return
      end
      
      @user = User.new
      @user.apply_omniauth(@omniauth)
      
      @user.valid?
      
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
    
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @user = User.new(params[:user])
    @user.authentications.build(provider: params[:authentication_provider], uid: params[:authentication_uid])

    respond_to do |format|
      if @user.save
        sign_in(@user)
        flash[:success] = t('notice.new_user')
        format.html { redirect_to @user}
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def sign_in(user)
    session[:user_id] = user.id
  end
end
