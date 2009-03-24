class AddThemesFoldername < ActiveRecord::Migration
  def self.up
    add_column :themes, :uri, :string
  end

  def self.down
    remove_column :themes, :uri
  end
end
