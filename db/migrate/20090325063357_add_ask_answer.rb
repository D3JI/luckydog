class AddAskAnswer < ActiveRecord::Migration
  def self.up
    add_column :answers, :status, :boolean, :default => false
    add_column :asks, :end_at, :datetime
  end

  def self.down
  end
end
