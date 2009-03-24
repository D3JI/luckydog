class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.integer :theme_category_id
      t.string :name
      t.string :stylesheet
      t.timestamps
    end
  end

  def self.down
    drop_table :themes
  end
end
