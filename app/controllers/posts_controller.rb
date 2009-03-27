class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @forum = Forum.find(params[:forum_id])
    @post = logged_in_user.posts.new(params[:post])
    @post.topic = @topic
    @post.forum = @forum
    @post.save
    redirect_to forum_topic_path(:forum_id => @forum.id, :id =>@topic.id)
  end
end
