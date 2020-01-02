# Write your code here!
Rack::Builder.parse_file('config.ru').first

require 'sinatra'

require_relative './app'
run Application