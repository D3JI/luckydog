class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt
      t.integer :role_id
      t.boolean :enable, :default => true
      t.timestamps
    end
    remove_column :users, :role_id
  end

  def self.down
    add_column :users, :role_id, :integer
    drop_table :admins
  end
end
