ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.namespace :admin do |a|
    a.resources :theme_categories do |category|
      category.resources :themes
    end
    a.resources :themes
  end

  map.resources :comments
  map.resources :space, :member => {:edit_reginfo => :get} do |space|
    space.resources :entries do |entry|
      entry.resources :comments
    end
  end

  map.controlpanel '/controlpanel', :controller => 'space', :action =>'panel'
  map.login '/login', :controller => 'account', :action => 'login'
  map.logout '/logout', :controller => 'account', :action => 'logout'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.adminhome '/adminhome', :controller => 'admin/home', :action => 'index'
  map.home '', :controller => 'home'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
