require 'spec_helper'

describe GroupsController do
	describe "given a group" do
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

		describe "visiting the index page" do
			before do
				get :index
			end

			it "should render the groups index" do 
				expect(response).to render_template("index")
			end

			it "retrieves all the groups" do
				assigns(:groups).should == Group.all
			end
		end

		describe "show individual article" do
			before do
				@params = @group
				post :create
			end

			it "have all the article's information" do
				#assigns(:article)[:image_url].should == @params[:image_url]
			end
		end

		describe "create a new group" do
			before do
				params = @group
				get :new
			end

			it "should print group name" do
				Group.where({id: @group.id}).first.name.should == "My Group"
			end
		end
	end
end