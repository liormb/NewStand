class User < ActiveRecord::Base
	has_many :users_groups
	has_many :groups, through: :users_groups
	has_many :comments
	has_many :likes
	
  attr_accessible :email, :first_name, :last_name, :password, :username
end
