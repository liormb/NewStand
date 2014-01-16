class Nytimes < ActiveRecord::Base

	@api_key_newswire = "9b5f51aa3fbdd59b6c5b31d2211b06cb:3:68680752"
	@url = "http://api.nytimes.com/svc/news/v3/content/all/**fields**/.json?&limit=**limit**&api-key=" + @api_key_newswire

	def self.sections(fields=["world"])
		fields.map do |field|
			case field
			  when "news" then "world"
				when "life" then "Fashion+%26+Style"
				when "money" then "business"
				when "tech" then "technology"
				else field
			end
		end
	end

	def self.content(fields=["world"], limit=5)
		content_url = @url.sub("**fields**",self.sections(fields)[0]).sub("**limit**",limit.to_s)
		HTTParty.get(content_url)['results']
	end

end