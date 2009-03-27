class AsksController < ApplicationController

  def category_asks
    @asks = Ask.find_all_by_ask_category_id(params[:category_id], :order => 'created_at desc')
  end

  def index
    @asks = Ask.find(:all, :order => 'created_at desc')
    @askings = Ask.find(:all, :order => 'created_at desc', :conditions => {:solved => false})
    @askeds = Ask.find(:all, :order => 'created_at desc', :conditions => {:solved => true})
    @closeasks = Ask.find(:all, :order => 'created_at desc', :conditions => {:closed => true })
  end

  def new
    @ask = Ask.new
  end

  def create
    @ask = Ask.new(params[:ask])
    @ask.user = logged_in_user
    @ask.end_at = Time.now + 5.days
    @ask.save
    redirect_to asks_path
  end

  def show
    @ask = Ask.find(params[:id])
  end

  def edit
    @ask = Ask.find(params[:id])
  end

  def update
    @ask = Ask.find(params[:id])
    @ask.update_attributes(params[:ask])
    redirect_to asks_path
  end

  def close_ask
    @ask = Ask.find(params[:id])
    @ask.update_attributes(:closed => true)
    redirect_to asks_path
  end

end
