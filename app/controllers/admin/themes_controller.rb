class Admin::ThemesController < ApplicationController
  def index
    @themecategories = ThemeCategory.find(:all, :order => 'created_at desc')
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(params[:theme])
    @theme.uri = "/themes/#{params[:theme][:uri]}"
    if @theme.save
      redirect_to :action => 'index'
    end
  end

  def destroy
    @themecategory = ThemeCategory.find(params[:theme_category_id])
    @theme = @themecategory.themes.find(params[:id])
    @theme.destroy
    redirect_to :action => 'index'
  end
end
