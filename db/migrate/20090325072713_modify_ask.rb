class ModifyAsk < ActiveRecord::Migration
  def self.up
    remove_column :asks, :status
    add_column :asks, :solved, :boolean, :default => false
    add_column :asks, :closed, :boolean, :default => false
  end

  def self.down
  end
end
