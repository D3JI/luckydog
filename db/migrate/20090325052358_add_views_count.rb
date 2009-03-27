class AddViewsCount < ActiveRecord::Migration
  def self.up
    add_column :entries, :views_count, :integer, :default => 0
    add_column :photos, :views_count, :integer, :default => 0
  end

  def self.down
  end
end
