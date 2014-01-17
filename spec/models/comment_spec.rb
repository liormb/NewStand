require 'spec_helper'

describe Comment do
  describe "check the comment model" do
  	before do
  		@user = FactoryGirl.create(:user)
  		@group = Group.create(
  			name: "My Group",
  			source: "New York Times",
  			article_url: "http://myurl.com",
  			title: "Article Title",
  			description: "This is the article description",
  			image_url: "http://myimage.png"
  		)
  		@comment = Comment.create(
  			user_id: @user.id,
  			group_id: @group.id,
  			content: "This is the content"
  		)
  	end

  	describe "after creating a comment" do
  		it "check that comment has been created" do
  			@comment.content.should == "This is the content"
  		end

  		describe "add a second comment for a user by using the add_comment method" do
  			before do
  				@comment2 = Comment.add_comment(
		  			user_id: @user.id,
		  			group_id: @group.id,
		  			content: "This is an additional content"
		  		)
  			end

  			it "check there are two comments" do
  				Comment.all.count.should == 2
  			end
  		end
  	end
  end
end