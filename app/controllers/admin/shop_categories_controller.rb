class Admin::ShopCategoriesController < ApplicationController

  def index
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => "name desc")
  end

  def new
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => "name desc")
    @category = ShopCategory.new
  end

  def create
    @category = ShopCategory.new(params[:category])
    if @category.save
      flash[:notice] = "添加分类成功"
      redirect_to admin_shop_categories_path
    end
  end

  def edit
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => "name desc")
    @category = ShopCategory.find(params[:id])
  end

  def update
    @category = ShopCategory.find(params[:id])
    if  @category.update_attributes(params[:category])
      flash[:notice] =  "修改成功"
    end
    redirect_to admin_shop_categories_path
  end

  def destroy
    @category = ShopCategory.find(params[:id])
    if @category
      @category.destroy
      flash[:notice] = "#{@category.name} 被删除！"
    else
      flash[:notice] = "删除#{@category.name}失败！"
    end
    redirect_to admin_shop_categories_path
  end

end
