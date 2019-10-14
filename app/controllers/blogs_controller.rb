class BlogsController < ApplicationController
  before_action :redirect_to_index, except: :index
  
  def index
    @blog = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.includes(:user)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create_trash
    @blog = Trash.create(text: params[:text], image: params[:image], user_id: current_user.id) 
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(update_blog_params) if blog.user_id == current_user.id
  end

  private
  def blog_params
    params.require(:blog).permit(:text).merge(user_id: current_user.id)
  end
  
  def redirect_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def update_blog_params
    params.permit(:text).merge(user_id: current_user.id)
  end
end
