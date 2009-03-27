ActionController::Routing::Routes.draw do |map|
  map.resources :users do |user|
    user.resources :messages, :collection => {:message_to => :put, :trashbox => :put }, 
      :member => { :message_delete => :delete, :reply => :put, :renew => :put }
    user.resources :friends, :collection => {:myrequest => :get, :needpassed => :get }
  end

  map.resources :events, :collection => {:category_events => :get } do |event|
    event.resources :comments
  end

  map.resources :asks, :member => {:close_ask => :put },:collection => {:category_asks => :put } do |ask|
    ask.resources :answers, :member => {:set_answer => :put }
  end

  map.resources :forums do |forum|
    forum.resources :topics do |topic|
      topic.resources :posts
    end
  end

  map.namespace :admin do |a|
    a.resources :theme_categories do |category|
      category.resources :themes
    end
    a.resources :themes
    a.resources :ask_categories
    a.resources :event_categories
    a.resources :shop_categories
  end

  map.resources :shops do |shop|
    shop.resources :products
  end

  map.resources :comments
  map.resources :space, :collection => {:myasks => :get },:member => {:edit_reginfo => :get, :edit_userinfo => :get } do |space|
    space.resources :user_infos
    space.resources :comments
    space.resources :entries do |entry|
      entry.resources :comments
    end
    space.resources :albums do |album|
      album.resources :photos, :member => {:set_avatar => :put, :set_primary => :put } do |photo|
        photo.resources :comments
      end
    end
  end

  map.loginshop '/loginshop', :controller => 'shops', :action => 'loginshop'
  map.logoutshop '/logoutshop', :controller => 'shops', :action => 'logoutshop'
  map.controlpanel '/controlpanel', :controller => 'space', :action =>'panel'
  map.login '/login', :controller => 'account', :action => 'login'
  map.logout '/logout', :controller => 'account', :action => 'logout'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.adminhome '/adminhome', :controller => 'admin/home', :action => 'index'
  map.home '', :controller => 'home'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
