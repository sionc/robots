class AddUserIdToRobots < ActiveRecord::Migration
  def self.up
    add_column :robots, :user_id, :string
  end

  def self.down
    remove_column :robots, :user_id
  end
end
