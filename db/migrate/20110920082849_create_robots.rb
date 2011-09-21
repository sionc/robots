class CreateRobots < ActiveRecord::Migration
  def self.up
    create_table :robots do |t|
      t.string :name
      t.string :model
      t.string :description
      t.string :hardware
      t.string :software
      t.string :applications

      t.timestamps
    end
  end

  def self.down
    drop_table :robots
  end
end
