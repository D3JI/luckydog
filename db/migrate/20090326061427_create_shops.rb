class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :salt, :hashed_password
      t.string :login_name
      t.integer :shop_category_id, :products_count
      t.string :shopname, :IDcard, :phone, :email, :address, :postcode
      t.boolean :is_recommend, :default => false #是否推荐
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end
