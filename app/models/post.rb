class Post < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :topic, :counter_cache => true
  belongs_to :forum, :counter_cache => true
end
