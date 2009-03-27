class ModifyData < ActiveRecord::Migration
  def self.up
    rename_column :photos, :deescription, :description
    remove_column :spaces, :theme_id
    add_column :spaces, :theme_id, :integer, :default => 1
    remove_column :friendships, :passed
    add_column :friendships, :passed, :boolean, :default => true
  end

  def self.down
  end
end
