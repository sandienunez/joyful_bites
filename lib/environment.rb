require 'pry'
require 'HTTParty'
require 'json'
#require 'dotenv-rails'
require 'dotenv'
Dotenv.load

require_relative './meals/cli'
require_relative './meals/api'
require_relative './meals/meal'
require_relative './meals/ingredient'