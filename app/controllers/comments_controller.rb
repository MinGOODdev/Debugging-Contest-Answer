class CommentsController < ApplicationController
  def create
    #@comment = comment.new
    @comment = Comment.new
    
    @comment.post_id = params[:post_id]
    @comment.content = params[:comment]
    @comment.save
    
    redirect_to '/'
  end

  def delete
    #comment = comment.find(params[:comment_id])
    comment = Comment.find(params[:comment_id])
    
    comment.destroy
    redirect_to '/'
  end
end
