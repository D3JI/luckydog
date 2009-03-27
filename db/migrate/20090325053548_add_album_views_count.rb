class AddAlbumViewsCount < ActiveRecord::Migration
  def self.up
    remove_column :spaces, :views_count
    add_column :albums, :views_count, :integer, :default => 0
    add_column :spaces, :views_count, :integer, :default => 0
  end

  def self.down
  end
end
