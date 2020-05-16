require 'pry'
require 'httparty'
require 'json'
#require 'dotenv-rails'
require 'dotenv'
Dotenv.load
require 'colorize'
require 'artii'

# require 'artii'
## ^^ outside dependencies = don't know exactly where they live in my system 


require_relative './meals/cli'
require_relative './meals/api'
require_relative './meals/meal'
require_relative './meals/ingredient'
##^^ don't need .rb at the end bc of shebang line in run executable 
##require_relative = files that live in my app, i know where exactly they are relative to my current file or folder


## Environment file = LISTS all dependencies for my project 
##file requirements (i.e. making sure your different files have access to one another), establishing connections to your database (if you have one) and ensuring that your test suite has access to the files that contain the code it is testing.
#httparty = gem makes it easy to work with API in ruby app (makes http fun again), interacts with my api
#require dotenv  = 
#require 'json' = parsing date from api in json 