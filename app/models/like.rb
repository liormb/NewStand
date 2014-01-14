class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :comment
  
  attr_accessible :user_id, :group_id, :comment_id
end
