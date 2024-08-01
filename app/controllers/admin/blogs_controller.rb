# app/controllers/admin/blogs_controller.rb
class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to admin_blog_path(@blog), notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to admin_blog_path(@blog), notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to admin_blogs_path, notice: 'Blog was successfully deleted.'
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :publication_date, :image)
  end

  def authorize_admin
    redirect_to(root_path, alert: 'Not authorized') unless current_user.admin?
  end
end
