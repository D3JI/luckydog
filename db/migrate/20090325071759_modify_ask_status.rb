class ModifyAskStatus < ActiveRecord::Migration
  def self.up
    add_column :asks, :status, :boolean, :default => true
  end

  def self.down
  end
end
