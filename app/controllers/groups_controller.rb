class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def new
		Group.add_group(params)
		redirect_to :action => 'index'
	end

	def create
		@article = {
			:article_url => params[:article_url],
			:image_url => params[:image_url],
			:source => params[:source],
			:title => params[:title],
			:admin_id => params[:admin_id],
			:description => params[:description]
		}
	end

	def edit
		@group = Group.find(params[:id])
	end

	def destroy
		Group.find(params[:id]).destroy
		redirect_to :action => 'index'
	end

end
