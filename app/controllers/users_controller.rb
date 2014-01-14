class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  	sign_out :user
		sign_out @user
		redirect_to "/"
	end
  
end