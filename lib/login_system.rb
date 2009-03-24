module LoginSystem
  protected

  #用户
  def is_logged_in?
    session[:user]
  end

  def logged_in_user
    @logged_in_user  = session[:user] if is_logged_in?
  end

  def logged_in_user= (user)
    unless user.nil?
      session[:user] = user
    end
  end

  def user_login_required
    unless is_logged_in?
      flash[:error] = "请先登录!"
      redirect_to login_path
    end
  end

  #管理员
  def admin_logged_in?
    @logged_in_admin = session[:admin] if session[:admin]
  end

  def logged_in_admin
    @logged_in_admin if admin_logged_in?
  end

  def logged_in_admin= (admin)
    unless admin.nil?
      session[:admin] = admin
      @logged_in_admin = admin
    end
  end

  def admin_login_required
    unless admin_logged_in?
      flash[:error] = "请先登录"
      redirect_to :controller => 'admin/home', :action => 'login'
    end
  end

  def self.included(base)
    base.send :helper_method, :is_logged_in?, :logged_in_user, :admin_logged_in?, :logged_in_admin
  end

end
