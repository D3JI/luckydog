class ProductsController < ApplicationController
  def new
    @shop = Shop.find(params[:shop_id])
    @product = Product.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.new(params[:product])
    if @product.save
      flash[:notice] = "产品添加成功"
      redirect_to shop_product_path(:id => @product, :shop_id => @shop)
    else
      redirect_to :action => 'new'
    end
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    redirect_to shop_product_path(:shop_id => @product.shop, :id => @product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to shop_products_path
  end

end
