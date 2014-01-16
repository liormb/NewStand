class CommentsController < ApplicationController

	def show
		@group = Group.find(params[:id])
	end

	def new
		Comment.add_comment(params)
		redirect_to :action => 'show', :id => params[:group_id]
	end
end
