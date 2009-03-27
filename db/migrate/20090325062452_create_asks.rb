class CreateAsks < ActiveRecord::Migration
  def self.up
    create_table :asks do |t|
      t.integer :user_id
      t.integer :ask_category_id
      t.string :title
      t.text :content
      t.integer :score, :default => 5
      t.integer :replies_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :asks
  end
end
