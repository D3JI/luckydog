class ForumsController < ApplicationController
  def index
    @forums = Forum.find(:all, :order => 'created_at desc')
  end
  
  def show
    @forum = Forum.find(params[:id])
  end

end
