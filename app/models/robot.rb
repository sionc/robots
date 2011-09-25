class Robot < ActiveRecord::Base

  attr_accessible :user_id, :name, :model, :description, :hardware, :software, :applications

  validates :name, :presence => true, :length => { :maximum => 50 }

  has_many :microposts, :dependent => :destroy
  belongs_to :user

  has_many :reverse_relationships, :foreign_key => "trackee_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy

  has_many :trackers, :through => :reverse_relationships

end
