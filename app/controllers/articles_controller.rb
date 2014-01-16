class ArticlesController < ApplicationController

	def index
		subject = params[:subject].nil? ? "world" : params[:subject]
		limit = 5

		# The Guardian
		@guardian_content = Guardian.content([subject],limit)

		# New York Times
		@nytimes_content = Nytimes.content([subject],limit)

		# USA Today
		# usatoday = Usatoday.content([subject],limit)
		# @usatoday_content = usatoday[:response]
		# @usatoday_image_urls = usatoday[:images]
	end

	def show
		@article = Guardian.page_content(params[:article_url])
		@article[:image_url] = params[:image_url]
		@article[:article_url] = params[:article_url]
		@article[:description] = params[:description]
	end

end
