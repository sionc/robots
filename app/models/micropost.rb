# This class was adapted from the example in Ruby on Rails Tutorial by Michael Hartl which
# can be found at http://ruby.railstutorial.org/ruby-on-rails-tutorial-book.

class Micropost < ActiveRecord::Base
  attr_accessible :content

  belongs_to :robot

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :robot_id, :presence => true

  default_scope :order => 'microposts.created_at DESC'

end
