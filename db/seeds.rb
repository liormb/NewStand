# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#require 'active_record/fixtures'
#ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "fixtures_file_name")

namespace :db do
	
	desc "seed the databse"
	task :seed do 
		User.create(
			{first_name: "Lior",last_name: "Elrom",email: "liormb@yahoo.com",username: "liormb",password: "1234"},
			{first_name: "Tim",last_name: "Elrom",email: "timmb@yahoo.com",username: "tim",password: "1234"}
		)
		Group.create(
			{name: "Group Name",admin_id: 1,source: "New York Times",title: "Article Title",description: "This is an article",article_url: "http://www.nytimes.com/video/world/middleeast/100000002647221/biden-gives-eulogy-at-sharons-funeral.html"}
		)
		UsersGroup.create(
			{user_id: 1,group_id: 1}
		)
		Comment.create(
			{user_id: 1,group_id: 1,content: "This is a content"}
		)
		Like.create(
			{user_id: 1,group_id: 1,comment_id: 1}
		)
	end
	
end