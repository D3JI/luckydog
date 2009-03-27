class Topic < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :forum, :counter_cache => true
  has_many :posts, :dependent => :destroy

  def lastpost
    @post = Post.find(:last, :conditions => { :topic_id => self.id })
  end

end
