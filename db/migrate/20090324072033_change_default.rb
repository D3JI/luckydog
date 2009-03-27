class ChangeDefault < ActiveRecord::Migration
  def self.up
    remove_column :spaces, :resolution
    add_column :spaces, :resolution, :string, :default => "800x600"
  end

  def self.down
  end
end
