class Theme < ActiveRecord::Base
  belongs_to :theme_category
  has_many :spaces
  validates_length_of :name, :minimum => 2
end
