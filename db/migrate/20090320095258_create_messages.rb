class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :parent_id
      t.string :title
      t.text :content
      t.boolean :trashed, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
