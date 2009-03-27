class ShopCategory < ActiveRecord::Base
  has_many :subcategories, :class_name => 'ShopCategory', :foreign_key => 'parent_id'
end
