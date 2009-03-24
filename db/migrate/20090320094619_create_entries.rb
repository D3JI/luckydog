class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.integer :comments_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
