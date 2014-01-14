class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :likes
  
  attr_accessible :user_id, :group_id, :comment_id, :content
end
