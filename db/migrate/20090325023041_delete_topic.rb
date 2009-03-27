class DeleteTopic < ActiveRecord::Migration
  def self.up
    remove_column :topics, :topic_category_id
  end

  def self.down
  end
end
