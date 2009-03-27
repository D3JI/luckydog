class ModifyInfoOpen < ActiveRecord::Migration
  def self.up
    remove_column :user_infos, :open
    add_column :user_infos, :overt, :integer, :default => 1
  end

  def self.down
  end
end
