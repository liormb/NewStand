class WelcomeController < ApplicationController
	def index

		@limit = 5

		# The Guardian
		@guardian_content = Guardian.content(["world"], @limit)

		# New York Times
		@nytimes_content = Nytimes.content(["world"],@limit)

		# USA Today
		# usatoday = Usatoday.content(["world"],@limit)
		# @usatoday_content = usatoday[:response]
		# @usatoday_image_urls = usatoday[:images]

	end
end