#require 'httparty'

class WelcomeController < ApplicationController
	def index
		usatoday_api_key_articles = "tbpz9ghqvkjegddnxmxc6pea"
		@url = "http://api.usatoday.com/open/articles/topnews/home?count=6&days=0&page=0&encoding=json&api_key=" + usatoday_api_key_articles
		@response = HTTParty.get(@url)

		@image_urls = []
		@response.each do |k1,v1|
			v1.each do |v2|
				image_tag = HTTParty.get(v2['guid'][0]['value'])
				itemp = image_tag =~ (/<aside/)
				istart = image_tag.index('src="',itemp)
				
				iend = image_tag.index('"',(istart + 5))
				@image_urls << image_tag[(istart + 5)..(iend - 1)].gsub('amp;','')
			end
		end
	end
end