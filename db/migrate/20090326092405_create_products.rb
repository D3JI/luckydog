class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :shop_id, :counts
      t.string :name, :address
      t.text :introduction, :offer_description, :reservation_help
      t.boolean :is_recommend, :default => false
      t.decimal :price
      t.float :discount
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
