class Admin::ThemeCategoriesController < ApplicationController
  def index
    @themecategories = ThemeCategory.find(:all, :order => 'created_at desc')
    @themecategory = ThemeCategory.new
  end

  def create
    @themecategory = ThemeCategory.new(params[:themecategory])
    if @themecategory.save
      redirect_to :action => 'index'
    end
  end

  def update
    @theme_category = ThemeCategory.find(params[:id])
    if @theme_category.update_attributes(params[:theme_category])
      redirect_to :action => 'index'
    end
  end

  def destroy
    @themecategory = ThemeCategory.find(params[:id])
    @themecategory.destroy
    redirect_to :action => 'index'
  end

end
