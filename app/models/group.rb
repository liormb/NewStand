class Group < ActiveRecord::Base
	has_many :users_groups
	has_many :users, through: :users_groups
	has_many :comments
	has_many :likes

  attr_accessible :admin_id, :article_url, :description, :name, :source, :title
end
