class HomeController < ApplicationController
  def index
    @parent_categories = ShopCategory.find(:all, :conditions => {:parent_id => nil})
  end
end
