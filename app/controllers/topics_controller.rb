class TopicsController < ApplicationController

  def new
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @topic = logged_in_user.topics.new(params[:topic])
    @topic.forum = @forum
    @topic.save
    redirect_to forum_topic_path(:forum_id => @forum.id, :id => @topic.id)
  end

  def show
    @topic = Topic.find(params[:id])
    unless logged_in_user == @topic.user
    @topic.update_attributes(:views_count => @topic.views_count + 1)
    end
  end

end
