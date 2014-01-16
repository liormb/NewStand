class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def new
		@article = {
			:article_url => params[:article_url],
			:image_url => params[:image_url],
			:source => params[:source],
			:title => params[:title],
			:description => params[:description]
		}
	end

	def create
		Group.add_group(params)
		redirect_to :action => 'index'
	end

end
