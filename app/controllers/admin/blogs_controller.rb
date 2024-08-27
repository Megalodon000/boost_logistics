module Admin
  class BlogsController < Admin::ApplicationController
    def index
      @blogs = Blog.all
    end

    def show
      @blog = Blog.find(params[:id])
    end

    def new
      @blog = Blog.new
    end

    def create
      @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to admin_blogs_path, notice: 'Blog was successfully created.'
      else
        render :new
      end
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def update
      @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        redirect_to admin_blog_path(@blog), notice: 'Blog was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @blog = Blog.find(params[:id])
      @blog.destroy
      redirect_to admin_blogs_path, notice: 'Blog was successfully destroyed.'
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :content, :image)
    end
  end
end
