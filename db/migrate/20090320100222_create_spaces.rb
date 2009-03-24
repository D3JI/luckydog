class CreateSpaces < ActiveRecord::Migration
  def self.up
    create_table :spaces do |t|
      t.integer :user_id
      t.string :title, :default => "这是你的标题"
      t.string :address
      t.text :description, :default => "这是你的空间描述"
      t.string :resolution, :default => "800*600"
      t.integer :theme_id, :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :spaces
  end
end
