require 'rubygems'
require 'bundler'
require 'dotenv'

Dotenv.load
Bundler.require

Twilio.configure do |config|
  config.account_sid = ENV['ACCOUNT_SID']
  config.auth_token = ENV['AUTH_TOKEN']
end

require './app/response_formatter'
require './app/google_maps_api'
require './app/parsed_input'
