class ThemeCategory < ActiveRecord::Base
  has_many :themes, :dependent => :destroy
end

