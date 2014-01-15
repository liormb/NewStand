class Guardian < ActiveRecord::Base

	@api_key_content = "rn8t8n9vuhf854p6zt8e45ct"
	@url = "http://content.guardianapis.com/?show-fields=trailText%2Cstandfirst%2Cthumbnail&show-editors-picks=true&edition=US"

	def self.content(fields=["world"], limit=5)
		content_url = @url + fields.join("&q=")
		HTTParty.get(content_url)
	end

end