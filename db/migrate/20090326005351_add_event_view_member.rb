class AddEventViewMember < ActiveRecord::Migration
  def self.up
    add_column :events, :views_count, :integer, :default => 0
    add_column :events, :members, :integer, :default => 0
  end

  def self.down
  end
end
