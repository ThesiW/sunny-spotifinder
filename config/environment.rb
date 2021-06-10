# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

config.hosts << /[a-z0-9]+\.ngrok\.io/
