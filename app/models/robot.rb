class Robot < ActiveRecord::Base

  has_many :microposts
  has_many :microposts, :dependent => :destroy

end
