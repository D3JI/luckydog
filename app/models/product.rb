class Product < ActiveRecord::Base
  belongs_to :shop, :counter_cache => true
  validates_presence_of :name, :price, :introduction
  validates_uniqueness_of :name
end
