require 'spec_helper'

describe Usatoday do
	describe "scan the response result comming from html page" do
		before do
			@url = "http://www.nytimes.com/2014/01/17/world/asia/lets-stop-all-the-insults-north-korea-says.html?_r=0"
			@response = HTTParty.get(@url)
		end

		describe "check the return content" do
			it "that is a Hash" do
				Usatoday.content.should be_kind_of(Hash)
			end

		end
	end
end