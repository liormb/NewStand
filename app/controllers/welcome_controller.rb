class WelcomeController < ApplicationController
	def index

		# Yelp
		consumer_key = 'WDjHW7RTo2sh5ELtVbPMlw'
		consumer_secret = 'GZZNzX0H2s82byYReZUJyUrEWoI'
		token = 'P6Osq4PTLW5zdCH-EWj2EIvU4ONb-ary'
		token_secret = '0BBdf3SbkGkwi4MfAWXj_T1Wed0'
		api_host = 'api.yelp.com'
		path = "/v2/search?term=restaurants&location=new%20york"

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)
		@yelp_response = access_token.get(path).body

		# The Guardian
		guardian_api_key_content = "rn8t8n9vuhf854p6zt8e45ct"
		limit = 5
		@guardian_limit = limit
		guardian_url = "http://content.guardianapis.com/?show-fields=trailText%2Cstandfirst%2Cthumbnail&show-editors-picks=true&edition=US&q=world&page-size=5"
		@guardian_response = HTTParty.get(guardian_url)

		# New York Times
		section = "world"  # u.s./sports and more
		limit = 5
		nytimes_api_key_newswire = "9b5f51aa3fbdd59b6c5b31d2211b06cb:3:68680752"
		nytimes_url = "http://api.nytimes.com/svc/news/v3/content/all/"+section+"/.json?&limit="+limit.to_s+"&api-key=" + nytimes_api_key_newswire
		@nytimes_response = HTTParty.get(nytimes_url)

		# USA Today
		section = "world" # home/news/travel/money/sports/life/tech/weather/nation/world/religion/yl-health/nfl/mlb/nba/books/pepole/music and more
		limit = 5
		usatoday_api_key_articles = "tbpz9ghqvkjegddnxmxc6pea"
		usatoday_url = "http://api.usatoday.com/open/articles/topnews/"+section+"?count="+limit.to_s+"&days=0&page=0&encoding=json&api_key=" + usatoday_api_key_articles
		@usatoday_response = HTTParty.get(usatoday_url)

		@usatoday_image_urls = []
		@usatoday_response.each do |k1,v1|
			v1.each do |v2|
				image_tag = HTTParty.get(v2['guid'][0]['value'])
				itemp = image_tag =~ (/class="articleBody"/)
				itemp = image_tag =~ (/role="main"/) if itemp.nil?
				if itemp.nil?
					@usatoday_image_urls << "default_image_url"
				else
					istart = image_tag.index('src="',itemp)
					iend = image_tag.index('"',(istart + 5))
					@usatoday_image_urls << image_tag[(istart + 5)..(iend - 1)].gsub('amp;','')
				end
			end
		end

	end
end