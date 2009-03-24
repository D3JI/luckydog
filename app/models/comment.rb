class Comment < ActiveRecord::Base
  belongs_to :space
  belongs_to :item, :polymorphic => true, :counter_cache => true
end
