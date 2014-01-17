require 'spec_helper'

describe CommentsController do
	describe "log user in" do
		before do
			sign_in User.create!(email: "test@example.com", password: "password")
			@group = Group.create({
				name: "My Group",
				source: "New York Times",
				article_url: "http://myurl.com",
				title: "Article Title",
				description: "This is the article description",
				image_url: "http://myimage.png"
			})
		end

		describe "go to show comments page" do
			before do
				@params = @group
				get :new
			end

			it "show specific comments" do
			end
		end
	end
end
