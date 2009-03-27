class AskCategory < ActiveRecord::Base
  has_many :asks, :dependent => :destroy
end
