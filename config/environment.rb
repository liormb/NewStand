# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Newstand::Application.initialize!

# How I setup my amazon key for local use (in .bash_profile or .bash_rc)
# export AMAZON_KEY="thisissupersecretdonttakethisorillbepoor"

# How I setup the same key on heroku (in terminal)
# heroku config:set AMAZON_KEY="thisissupersecretdonttakethisorillbepoor"

# This is so this will work (in rails app)
# ENV['AMAZON_KEY']
