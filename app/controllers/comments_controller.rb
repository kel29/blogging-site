class CommentsController < ApplicationController
  before_action :set_blog

  def create
    @comment = Comment.new(params.permit(:commentator, :content, :blog_id))
    if @comment.save
      redirect_to @blog
    else
      render @blog
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @blog
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

end
