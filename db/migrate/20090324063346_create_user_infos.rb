class CreateUserInfos < ActiveRecord::Migration
  def self.up
    create_table :user_infos do |t|
      t.string :true_name
      t.integer :user_id
      t.boolean :sex
      t.date :birthday
      t.string :blood
      t.integer :height
      t.integer :weight
      t.string :bodytype
      t.string :from
      t.string :location

      t.string :job
      t.string :company
      t.string :position
      t.string :school
      t.string :educational
      t.string :belief
      t.string :dress
      t.boolean :drink, :default => false
      t.boolean :smoke, :default => false
      t.string :personality
      t.string :hobiy

      t.string :qq
      t.string :msn
      t.string :telephone
      t.string :mobilephone

      t.integer :open, :default => 1
      t.integer :authenticate, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :user_infos
  end
end
