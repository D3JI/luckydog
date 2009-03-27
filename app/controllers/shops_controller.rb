class ShopsController < ApplicationController
  def loginshop
    if request.post?
      reset_session
      if @login = Shop.authenticate(params[:login_name],params[:password])
        redirect_to edit_shop_path(:id => @login.id)
      else
        flash[:error] = "Error!"
      end
    end
  end

  def logoutshop
    reset_session
    flash[:notice] = '您已退出登录'
    redirect_to loginshop_path
  end

  def index
  end

  def new
    @shop = Shop.new
  end

  def create
    if request.post?
    @shop = Shop.new(params[:shop])
    @invitecode = InviteCode.new
    @invitecode.login_name = params[:shop][:login_name]
    @invitecode.password = params[:shop][:password]
    @shop.save
    @invitecode.save
    redirect_to shops_path
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(params[:shop])
      redirect_to shop_path(:id => @shop)
    end
  end

end
