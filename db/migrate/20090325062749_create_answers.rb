class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :ask_id
      t.integer :user_id
      t.text :content
      t.timestamps
    end
    add_column :users, :asks_count, :integer, :default => 0
  end

  def self.down
    drop_table :answers
  end
end
