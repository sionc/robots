class Robot < ActiveRecord::Base

  attr_accessible :name, :model, :description, :hardware, :software, :applications

  has_many :microposts, :dependent => :destroy
  belongs_to :user

end
