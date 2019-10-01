class CommentsController < ApplicationController

  def create
    byebug
    blog = Blog.find(params[:blog_id])
    @new_comment = Comment.new(params.permit(:commentator, :content, :blog_id))
    if @new_comment.save
      redirect_to blog
    else
      render blog
    end
  end

end
