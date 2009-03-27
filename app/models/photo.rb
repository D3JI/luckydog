require 'RMagick'
class Photo < ActiveRecord::Base
#  include ActivityLogger
#  after_create :log_activity

  has_many :comments, :as => :item
  belongs_to :album, :counter_cache => true
  belongs_to :space, :counter_cache => true
  has_attachment :storage => :file_system,
    :max_size => 5.megabytes,
    :content_type => :image,
    :thumbnails => { :tiny => '80x80>', :thumb => '120x120>' },
    :processor => :Rmagick
  validates_as_attachment

  def log_activity
    add_activities(:item => self, :user => self.user)
  end
end
