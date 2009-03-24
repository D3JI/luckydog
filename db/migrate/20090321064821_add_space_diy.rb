class AddSpaceDiy < ActiveRecord::Migration
  def self.up
    add_column :spaces, :diy, :string
  end

  def self.down
    remove_column :spaces, :diy
  end
end
