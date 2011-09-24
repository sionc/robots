class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :tracker_id
      t.integer :trackee_id

      t.timestamps
    end
    add_index :relationships, :tracker_id
    add_index :relationships, :trackee_id
    add_index :relationships, [:tracker_id, :trackee_id], :unique => true
  end

  def self.down
    drop_table :relationships
  end
end
