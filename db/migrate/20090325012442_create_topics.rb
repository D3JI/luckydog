class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer :user_id
      t.integer :forum_id
      t.integer :topic_category_id
      t.string :title
      t.text :content
      t.integer :posts_count, :default => 0
      t.integer :views_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
