require 'spec_helper'

describe Nytimes do
	describe "scan the response result comming from html page" do
		before do
			@fields = ["news","life","money","tech","other"]
		end

		describe "check the return content" do
			it "take a sports field and alter it to match Guardian: sport" do
				Nytimes.sections(@fields).should == ["world","Fashion+%26+Style","business","technology","other"]
			end

			it "get an Array of results" do
				Nytimes.content(@fields).should be_kind_of(Array) 
			end
		end
	end
end