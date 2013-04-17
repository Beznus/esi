class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  
  def show
	@user = User.find(params[:id])
    @beers = Beer.find_by_created_by(params[:id])
	@endorses = @user.endorses.find_by_user_id(params[:id])
  end
  
  def new
	@user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def create
	@user = User.new(params[:user])
	if @user.save
	  sign_in @user
	  flash[:success] = "Welcome to the Sample App!"
	  redirect_to @user
	else
	  render 'new'
	end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
	  sign_in @user
	  redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    if User.find(params[:id]).admin?
	  flash.now[:notice] = "Can't delete Admin"
	else
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_url
	end
  end
  
  private
  
    def signed_in_user
	  unless signed_in?
	    store_location
	    redirect_to signin_url, notice: "Please sign in."
	  end
	end
	
	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_path) unless current_user?(@user)
	end
	
	def admin_user
	  redirect_to(root_path) unless current_user.admin?
	end
end
