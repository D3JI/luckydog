class ModifySpaceStylename < ActiveRecord::Migration
  def self.up
    remove_column :spaces, :stylename
    add_column :spaces, :theme_id, :integer
  end

  def self.down
    add_column :spaces, :stylename, :string
    remove_column :spaces, :theme_id
  end
end
