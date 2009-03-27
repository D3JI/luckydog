class ModifyUserTopicCount < ActiveRecord::Migration
  def self.up
    add_column :users, :topics_count, :integer, :default => 0
    add_column :users, :posts_count, :integer, :default => 0
  end

  def self.down
  end
end
