class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.integer :score, :default => 10
      t.integer :grade_id
      t.integer :role_id
      t.integer :albums_count, :default => 0
      t.integer :entries_count, :default => 0
      t.integer :photos_count, :default => 0
      t.boolean :enable, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
