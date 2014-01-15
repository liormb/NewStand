class Usatoday < ActiveRecord::Base

	@api_key_articles = "tbpz9ghqvkjegddnxmxc6pea"
	@url = "http://api.usatoday.com/open/articles/topnews/**fields**?count=**limit**&days=0&page=0&encoding=json&api_key=" + @api_key_articles

	def self.content(fields=["world"], limit=5)
		content_url = @url.sub("**fields**",fields[0]).sub("**limit**",limit.to_s)
		response = HTTParty.get(content_url)
		{ response: response, images: self.article_images(response) }
	end

	def self.article_images(response)
		image_urls = []
		response.each do |k1,v1|
			v1.each do |v2|
				image_tag = HTTParty.get(v2['guid'][0]['value'])
				itemp = image_tag =~ (/class="articleBody"/)
				itemp = image_tag =~ (/role="main"/) if itemp.nil?
				if itemp.nil?
					image_urls << "default_image_url"
				else
					istart = image_tag.index('src="',itemp)
					iend = image_tag.index('"',(istart + 5))
					image_urls << image_tag[(istart + 5)..(iend - 1)].gsub('amp;','')
				end
			end
		end
		image_urls
	end

end