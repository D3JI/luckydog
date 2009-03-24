class SpaceController < ApplicationController
  #  layout 'spaces'
  def edit
    @space = Space.find(params[:id])
    @categories = ThemeCategory.find(:all, :order => 'created_at desc')
  end

  def update
    @space = Space.find(params[:id])
    if @space.update_attributes(params[:space])
      redirect_to controlpanel_path(:id => @space)
    else
      render :action => 'edit'
    end
  end

  def show
    @space = Space.find(params[:id])
    @user = @space.user
    @entries = @space.entries.find(:all, :order => 'created_at DESC') 
    @albums = @space.albums.find(:all, :order => 'created_at DESC')
    @friends = @space.friendships
    @visits = Visit.find_by_sql ["SELECT guest_id, count(DISTINCT guest_id) from visits where url like '%users/?%' GROUP BY guest_id ", @user]
    @comments = @space.comments
  end

  def panel
    @space = Space.find(params[:id])
    @user = @space.user
    @recent_users = User.find(:all, :order => 'created_at DESC', :limit => 20)
    @friends = Friendship.find_by_sql ["SELECT user_id from friendships where friend_id = ?", @user]
    @activities = Activity.find_by_sql ["SELECT * from activities where user_id in (?)", @friends]
    @visits = Visit.find_by_sql ["SELECT guest_id, count(DISTINCT guest_id) from visits where url like '%users/?%' GROUP BY guest_id ", @user]
  end

  def edit_reginfo
    @user = User.find(params[:id])
    @space = @user.space
  end

end
