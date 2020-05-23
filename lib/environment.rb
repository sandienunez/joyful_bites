require 'pry'
require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load
require 'colorize'
require 'artii'



require_relative './meals/cli'
require_relative './meals/api'
require_relative './meals/meal'
require_relative './meals/ingredient'
