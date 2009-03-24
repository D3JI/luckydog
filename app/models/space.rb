class Space < ActiveRecord::Base
  belongs_to :user
  belongs_to :theme
  has_one :avatar, :class_name => 'Photo', :conditions => ["photos.avatar = ?", true]
  has_many :albums, :dependent => :destroy
  has_many :entries, :dependent => :destroy
  has_many :comments, :dependent => :destroy, :as => :item
  has_many :photos, :dependent => :destroy
end
