class CreateShopCategories < ActiveRecord::Migration
  def self.up
    create_table :shop_categories do |t|
      t.string :name
      t.integer :parent_id
      t.integer :shops_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :shop_categories
  end
end
