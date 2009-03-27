class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @space = Space.create(:user_id => @user.id, :address => "i.#{request.host}/#{@user.username}")
      @userinfo = UserInfo.create(:user_id => @user.id)
      #@space = @user.space.create(:address => "i.#{request.host}/#{@user.username}")
      self.logged_in_user= @user
      flash[:notice] = "用户注册成功"
      redirect_to controlpanel_path(:id => @space)
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    #在model里没有作密码一致性的验证,需要在view里作JS验证
    if logged_in_user.hashed_password == User.encrypt_password(params[:user][:oldpassword], logged_in_user.salt)
      logged_in_user.update_attributes(params[:user])
      case params[:modify]
      when 'pwd'
        flash[:password] = "密码更改完毕"
      when 'email'
        flash[:email] = "邮箱更改完毕"
      end
    else
      case params[:modify]
      when 'pwd'
        flash[:password] = "输入的历史密码有误"
      when 'email'
        flash[:email] = "输入的历史密码有误"
      end
    end
    redirect_to edit_reginfo_space_path(:id => logged_in_user)
  end
end
