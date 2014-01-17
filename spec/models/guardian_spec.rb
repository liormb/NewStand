require 'spec_helper'

describe Guardian do
	describe "scan the response result comming from html page" do
		before do
			@fields = ["news","sports","life","money","tech","other"]
			@url = "http://www.theguardian.com/world/2014/jan/16/nsa-collects-millions-text-messages-daily-untargeted-global-sweep"
			@url = "http://www.theguardian.com/world/2014/jan/16/chile-dakar-rally-protests-archaeologists-indigenous-groups-environmentalists"
			@response = HTTParty.get(@url)
		end

		describe "check the return content" do
			it "take a sports field and alter it to match Guardian: sport" do
				Guardian.sections(@fields).should == ["world","sport","culture","business","technology","other"]
			end

			it "get the article header" do
				Guardian.article_title(@response).should match(/./) # == "Article Header"
			end

			it "get the article description" do
				Guardian.article_description(@response).should match(/./)#== "Article Description"
			end

			describe "testing the content" do
				before do
					@content = Guardian.article_content(@response)
				end

				it "get the article content" do
					@content.should include("<p>")
				end
			end

			it "return an Array as its response" do
				Guardian.content.should be_kind_of(Array) 
			end

			it "sourse equel to newspapaer name" do
				Guardian.page_content(@url)[:source].should == "The Guardian"
			end
		end
	end
end