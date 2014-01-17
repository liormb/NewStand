require 'spec_helper'

describe User do
  describe "check the user model" do
  	before do
  		@user = FactoryGirl.create(:user)
  	end

  	it "print the user full name" do
  		@user.fullname.should == "John Smith"
  	end
  end
end