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

# Sinatra config settings
set :root, File.join(APP_ROOT, 'app')
set :views, Proc.new { File.join(root, "views") }

# Require all files inside the lib/ and app/controllers directories
Dir[File.join(APP_ROOT, 'lib', '*.rb')].each { |file| require file }
Dir[File.join(APP_ROOT, 'app', 'controllers', '*.rb')].each { |file| require file }
