class AddSpaceCount < ActiveRecord::Migration
  def self.up
    remove_column :users, :albums_count
    remove_column :users, :photos_count
    remove_column :users, :entries_count
    add_column :spaces, :albums_count, :integer
    add_column :spaces, :photos_count, :integer
    add_column :spaces, :comments_count, :integer
    add_column :spaces, :entries_count, :integer
  end

  def self.down
  end
end
