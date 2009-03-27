class ModifyAnswer < ActiveRecord::Migration
  def self.up
    rename_column :asks, :replies_count, :answers_count
  end

  def self.down
  end
end
