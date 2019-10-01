class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :like]

  def index
    @blogs = Blog.all
    
    if params[:query]
      @tag = Tag.find_by(tag_name: params[:query])
      if @tag
        @blogs = Blog.all.select { |blog| blog.tags.include?(@tag) }
      else
        flash[:search_error] = "Currently there are not any articles with that tag"
        render :index
      end
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def like
    @blog.like_post
    redirect_to @blog
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :likes, :user_id, :query, tag_ids: [])
  end

end
