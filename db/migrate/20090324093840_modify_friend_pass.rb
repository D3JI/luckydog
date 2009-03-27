class ModifyFriendPass < ActiveRecord::Migration
  def self.up
    remove_column :friendships, :passed
    add_column :friendships, :passed, :boolean, :default => true
  end

  def self.down
  end
end
