class AddPostForumId < ActiveRecord::Migration
  def self.up
    add_column :posts, :forum_id, :integer
  end

  def self.down
  end
end
