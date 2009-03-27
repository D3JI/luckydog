class ModifyPost < ActiveRecord::Migration
  def self.up
    add_index :posts, :topic_id
  end

  def self.down
  end
end
