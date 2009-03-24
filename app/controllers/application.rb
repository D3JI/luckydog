# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  include LoginSystem
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery  :secret => '43d1965fce1995d1c863975f4e2e4bc1'

  def recent_visit
    if is_logged_in?
      unless session[:user] == params[:user_id]
        visit = Visit.new
        visit.guest_id = session[:user]
        visit.url = request.url
        visit.save!
      end
    end
  end
end
