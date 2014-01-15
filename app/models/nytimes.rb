class Nytimes < ActiveRecord::Base

	@api_key_newswire = "9b5f51aa3fbdd59b6c5b31d2211b06cb:3:68680752"
	@url = "http://api.nytimes.com/svc/news/v3/content/all/**fields**/.json?&limit=**limit**&api-key=" + @api_key_newswire

	def self.content(fields=["world"], limit=5)
		content_url = @url.sub("**fields**",fields[0]).sub("**limit**",limit.to_s)
		HTTParty.get(content_url)
	end

end