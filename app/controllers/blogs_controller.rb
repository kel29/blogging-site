class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :like]

  def index
    @featured = Blog.featured_blog
    @most_recent = Blog.most_recent
    @rest_of_the_blogs = Blog.rest_of_the_blogs
    
    if params[:query]
      @tag = Tag.find_by(tag_name: params[:query])
      if @tag
        @rest_of_the_blogs = Blog.all.order('likes DESC').select { |blog| blog.tags.include?(@tag) }
      else
        flash[:search_error] = "Currently there are not any articles with that tag"
        render :index
      end
    end
  end

  def new
    redirect(blogs_path)
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.likes = 0
    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def edit
    redirect(@blog)
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
    redirect(@blog)
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :likes, :user_id, :query, :subtitle, tag_ids: [])
  end

end
