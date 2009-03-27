class UserInfosController < ApplicationController
  def edit
  end

  def update
    @space = Space.find(params[:space_id])
    @userinfo = @space.user.user_info
    if @userinfo.update_attributes(params[:userinfo])
      flash[:notice] = "隐私设置完毕"
      redirect_to edit_userinfo_space_path(:id => @space)
    end
  end
end
