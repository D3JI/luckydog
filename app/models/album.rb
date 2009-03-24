class Album < ActiveRecord::Base
  belongs_to :space, :counter_cache => true
  has_many :photos, :dependent => :destroy
  has_one :primary, :class_name => 'Photo', :conditions =>["photos.primary = ?", true]
end
