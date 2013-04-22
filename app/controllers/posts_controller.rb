class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy, :index]
  before_filter :correct_user, :admin_user,  only: [:edit, :update]
  
  def show
	@post = Post.find(params[:id])
  end
  
  def index
	@posts = Post.paginate(page: params[:page])
  end
  
  def new
    @post = Post.new
  end
  
  def create
	@post = Post.new(params[:post])
	@post.created_by = current_user.id
	if @post.save
	  flash[:success] = "New Post Added!"
	  redirect_to @post
	else
	  render 'new'
	end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
  end
  
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post destroyed."
    redirect_to posts_url
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
