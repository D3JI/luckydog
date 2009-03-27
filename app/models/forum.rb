class Forum < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_one :last_post, :class_name => 'Post', :order => 'created_at desc'

end
