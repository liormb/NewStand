class Group < ActiveRecord::Base
	has_many :users_groups
	has_many :users, through: :users_groups
	has_many :comments
	has_many :likes

  attr_accessible :admin_id, :article_url, :description, :name, :source, :title, :image_url

  def self.add_group(group)
  	self.create(
  		name: group[:name],
  		admin_id: group[:admin_id],
  		source: group[:source],
  		article_url: group[:article_url],
  		title: group[:title],
  		description: group[:description],
      image_url: group[:image_url]
  	)
  end
  
end
