class Entry < ActiveRecord::Base
#  include ActivityLogger
#  after_create :log_activity

  has_many :comments, :as => :item
  belongs_to :space, :counter_cache => true

  def log_activity
    add_activities(:item => self, :user => self.user)
  end
end
