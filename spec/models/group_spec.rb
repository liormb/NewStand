require 'spec_helper'

describe Group do
  describe "check group setting" do
  	before do
  		@group = Group.create(
  			name: "My Group",
  			source: "New York Times",
  			article_url: "http://myurl.com",
  			title: "Article Title",
  			description: "This is the article description",
  			image_url: "http://myimage.png"
  		)
  	end

  	describe "create new group" do
	  	it "create new group name My Group" do
	  		Group.find_by_name("My Group").name.should == "My Group"
	  	end
  	end

  	describe "add new group using the add_group method in the group model" do
  		it "add group" do
  			Group.add_group(@group).name.should == "My Group"
  		end
  	end
	end
end