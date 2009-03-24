class CreateThemeCategories < ActiveRecord::Migration
  def self.up
    create_table :theme_categories do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :theme_categories
  end
end
