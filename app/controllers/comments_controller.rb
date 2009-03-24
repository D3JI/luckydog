class CommentsController < ApplicationController
  layout 'space'
  def new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.space = logged_in_user.space
    if @comment.save
      redirect_to  params[:switch]+"#"+@comment.id.to_s
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to params[:backurl]
  end

end
