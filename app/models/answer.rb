class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :ask, :counter_cache => true

end
