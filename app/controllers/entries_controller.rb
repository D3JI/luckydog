class EntriesController < ApplicationController
  layout 'space'

  def new
    @space = Space.find(params[:space_id])
    @entry = Entry.new
  end

  def create
    @space = Space.find(params[:space_id])
    @entry = Entry.new(params[:entry])
    @entry.space = @space
    if @entry.save
      flash[:notice] = "日志创建成功 "
      redirect_to space_entry_path(:id =>@entry)
    else
      render :action => 'new'
    end
  end

  def index
    @space = Space.find(params[:space_id])
    @entries = @space.entries.find(:all, :order => 'created_at desc')
  end

  def show
    @space = Space.find(params[:space_id])
    @entry = Entry.find(params[:id])
    unless logged_in_user == @space.user 
      @entry.update_attributes(:views_count => @entry.views_count + 1)
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      redirect_to space_entry_path(:id => @entry)
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to space_entries_path(:space_id => @entry.space)
  end
end
