require 'rubygems'
require 'bundler'
require 'dotenv'

Dotenv.load
Bundler.require

Twilio.configure do |config|
  config.account_sid = ENV['ACCOUNT_SID']
  config.auth_token = ENV['AUTH_TOKEN']
end

APP_ROOT =  Pathname.new(File.expand_path('../', __dir__))
APP_NAME =  APP_ROOT.basename.to_s

# Require all ruby files inside the lib/ directory
Dir[File.join(APP_ROOT, 'lib', '*.rb')].each { |file| require file }
# Require all controllers for the web app
Dir[File.join(APP_ROOT, 'app', 'controllers', '*.rb')].each { |file| require file }
