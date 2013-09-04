class UsersController < ApplicationController
		before_filter :require_user, :only => [:edit, :show, :update]
		before_filter :require_no_user, :only => [:new, :create]
  before_filter :block_admin_creation, :only => [:create]
  layout "before_login", :only => [:new, :create]
  # Cancan check role and authorize user based
  load_and_authorize_resource
		
		def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save
      flash[:notice] = "Your account has been created."
      redirect_to signup_url
    else
      flash[:notice] = "There was a problem creating you."
      render :action => :new
    end

  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def unauthorized
  end
  
  def block_admin_creation
    if params[:user] && params[:user][:role].downcase == "admin"
      params[:user][:role] = "student"
    end
  end
end
