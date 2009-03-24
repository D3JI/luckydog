class ModifySpace < ActiveRecord::Migration
  def self.up
    remove_column :spaces, :diy
    change_column_default :spaces, :resolution, :default => "800x600"
  end

  def self.down
    add_column :spaces, :diy, :string
  end
end
