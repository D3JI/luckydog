class ModifyUserSpace < ActiveRecord::Migration
  def self.up
    rename_column :albums, :user_id, :space_id
    rename_column :comments, :user_id, :space_id
    rename_column :entries, :user_id, :space_id
    rename_column :photos, :user_id, :space_id
  end

  def self.down
  end
end
