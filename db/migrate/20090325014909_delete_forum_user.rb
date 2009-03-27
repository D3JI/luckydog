class DeleteForumUser < ActiveRecord::Migration
  def self.up
    remove_column :forums, :user_id
  end

  def self.down
  end
end
