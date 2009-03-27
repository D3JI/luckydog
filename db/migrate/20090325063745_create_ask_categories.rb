class CreateAskCategories < ActiveRecord::Migration
  def self.up
    create_table :ask_categories do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :ask_categories
  end
end
