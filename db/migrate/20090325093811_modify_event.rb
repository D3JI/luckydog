class ModifyEvent < ActiveRecord::Migration
  def self.up
    remove_column :events, :status
    add_column :events, :closed, :boolean, :default => false
    add_column :events, :offical, :boolean, :default => false
  end

  def self.down
  end
end
