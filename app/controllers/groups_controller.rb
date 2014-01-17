class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def new
		Group.add_group(params)
		# @article = {
		# 	:article_url => params[:article_url],
		# 	:image_url => params[:image_url],
		# 	:source => params[:source],
		# 	:title => params[:title],
		# 	:description => params[:description]
		# }
		redirect_to :action => 'index'
	end

	def create
		@article = {
			:article_url => params[:article_url],
			:image_url => params[:image_url],
			:source => params[:source],
			:title => params[:title],
			:description => params[:description]
		}
		#Group.add_group(params)
		#redirect_to :action => 'new', :params => params
	end

end
