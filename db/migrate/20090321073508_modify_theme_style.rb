class ModifyThemeStyle < ActiveRecord::Migration
  def self.up
    remove_column :themes, :stylesheet
  end

  def self.down
    add_column :themes, :stylesheet, :string
  end
end
