class AddEventComments < ActiveRecord::Migration
  def self.up
    add_column :events, :comments_count, :integer, :default => 0
  end

  def self.down
  end
end
