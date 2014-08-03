require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

# Load Sinatra Framework (with AR)
require 'sinatra'
require 'sinatra/activerecord'

# Load additional gems
require 'instagram'

# Configure Instagram Client ID and Client Secret
Instagram.configure do |config|
  config.client_id = "7e7a57487ca642278dd50158878e7aae"
  config.client_secret = "b44a0e786426401e97d54e92519f0f28"
end

require 'faker'
require 'pry'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Sinatra configuration
configure do
  set :root, APP_ROOT.to_path
  set :server, :puma

  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'lighthouselabssecret'

  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Load the routes / actions
require APP_ROOT.join('app', 'helpers')

require APP_ROOT.join('app/actions_routes', 'index')
require APP_ROOT.join('app/actions_routes', 'instagram_auth')
require APP_ROOT.join('app/actions_routes', 'artist')
require APP_ROOT.join('app/actions_routes', 'review')
require APP_ROOT.join('app/actions_routes', 'not_found')