# This class was adapted from the example in Ruby on Rails Tutorial by Michael Hartl which
# can be found at http://ruby.railstutorial.org/ruby-on-rails-tutorial-book.

class Relationship < ActiveRecord::Base
  attr_accessible :trackee_id, :tracker_id

  belongs_to :trackee, :class_name => "Robot"
  belongs_to :tracker, :class_name => "User"

  validates :trackee_id, :presence => true
  validates :tracker_id, :presence => true
end
