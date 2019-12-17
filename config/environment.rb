ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

# require 'em/pure_ruby'
require 'bundler/setup'
Bundler.require
require_relative '../app.rb'