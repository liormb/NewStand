class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :likes
  
  attr_accessible :user_id, :group_id, :comment_id, :content

  def self.add_comment(comment)
  	self.create(
  		user_id: comment[:user_id],
  		group_id: comment[:group_id],
  		content: comment[:content]
  	)
  end
end
