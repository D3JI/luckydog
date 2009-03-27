class RemoveProductcolumn < ActiveRecord::Migration
  def self.up
    remove_column :products, :counts
    remove_column :products, :reservation_help
    remove_column :products, :discount
    add_column :products, :discount, :numeric
  end

  def self.down
  end
end
