class Admin::HomeController < ApplicationController
  before_filter :admin_login_required, :except => [:login]
  def index
    @admin = Admin.find(session[:admin])
  end

  def login
    if request.post?
      reset_session
      if @admin = Admin.authenticate(params[:name], params[:password])
        self.logged_in_admin= @admin
        redirect_to adminhome_path
      else
        render :action => 'login'
      end
    end
  end

  def logout
    reset_session
    flash[:notice] = "您已经退出管理界面" 
    redirect_to :action => 'login'
  end
end
