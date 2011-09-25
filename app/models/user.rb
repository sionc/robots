class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  validates :name,  :length => { :maximum => 50 }
  validates :email, :presence => true

  has_many :robots, :dependent => :destroy

  has_many :relationships, :foreign_key => "tracker_id",
                           :dependent => :destroy

  has_many :tracking, :through => :relationships, :source => :trackee

  def tracking?(trackee)
    relationships.find_by_trackee_id(trackee)
  end

  def track!(trackee)
    relationships.create!(:trackee_id => trackee.id)
  end

  def untrack!(trackee)
    relationships.find_by_trackee_id(trackee).destroy
  end

end
