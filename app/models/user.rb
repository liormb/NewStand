class User < ActiveRecord::Base
	has_many :users_groups
	has_many :groups, through: :users_groups
	has_many :comments
	has_many :likes
	
  attr_accessible :first_name, :last_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def fullname
    self.first_name.nil? && self.last_name.nil? ? "Stranger" : self.first_name + " " + self.last_name
  end
end
