class Guardian < ActiveRecord::Base

	@position = 0

	@api_key_content = "rn8t8n9vuhf854p6zt8e45ct"
	@url = "http://content.guardianapis.com/search?section=**fields**&page-size=**limit**&show-fields=thumbnail%2Cstandfirst%2CtrailText"

	def self.sections(fields=["world"])
		fields.map do |field|
			case field
				when "news" then "world"
				when "sports" then "sport"
				when "life" then "culture"
				when "money" then "business"
				when "tech" then "technology"
				else field
			end
		end
	end

	def self.content(fields=["world"], limit=5)
		content_url = @url.sub("**fields**",self.sections(fields)[0]).sub("**limit**",limit.to_s)
		HTTParty.get(content_url)['response']['results']
	end

	def self.article_title(text)
		pos = @position
		pos = text.index("main-article-info")
		pos = text.index("<h1",pos)
		istart = text.index(">",pos) + 1
		iend   = text.index("</h1>",istart) - 1
		@position = iend
		return text[istart..iend]
	end

	def self.article_description(text)
		pos = @position
		pos = text.index("description",pos)
		istart = text.index(">",pos) + 1
		iend   = text.index("</",istart) - 1
		@position = iend
		return text[istart..iend]
	end

	def self.article_content(text)
		pos = @position
		pos = text.index("article-body-blocks",pos)
		istart = text.index("<p",pos)
		iend   = text.index("</div>",istart) - 1
		@position = iend + "</div>".length
		content = text[istart..iend]

		while content.index("<a") do
			astart = content.index("<a")
			aend   = content.index(">",astart)
			temp_content = content[astart..aend]
			content = content.sub(temp_content,"")
		end
		content = content.gsub("</a>","").strip

		return content
	end

	def self.page_content(url)
		content = {}
		response = HTTParty.get(url)

		content[:source] = "The Guardian"
		content[:title] = self.article_title(response)
		content[:description] = self.article_description(response)
		content[:content] = self.article_content(response)

		return content
	end

end