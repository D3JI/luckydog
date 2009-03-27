class DeleteForumLastPost < ActiveRecord::Migration
  def self.up
    remove_column :forums, :last_post
  end

  def self.down
  end
end
