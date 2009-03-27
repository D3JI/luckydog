class AddSpaceViewsCount < ActiveRecord::Migration
  def self.up
    add_column :spaces, :views_count, :integer, :default => 0
  end

  def self.down
  end
end
