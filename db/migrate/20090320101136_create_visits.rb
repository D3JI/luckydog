class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
      t.integer :guest_id
      t.string :url
      t.timestamps
    end
    Admin.create(:name => 'admin', :password => 'admin', :password_confirmation => 'admin', :role_id => 1)
  end

  def self.down
    drop_table :visits
  end
end
