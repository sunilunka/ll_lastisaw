CALLBACK_URL = "http://localhost:3000/oauth/callback"

# Configure Instagram Client ID and Client Secret
Instagram.configure do |config|
  config.client_id = "7e7a57487ca642278dd50158878e7aae"
  config.client_secret = "b44a0e786426401e97d54e92519f0f28"
end

get "/" do
  # Return a list of the most recent Instagram items (e.g.) #lollapalooza
  @tags = Instagram.tag_recent_media('lollapalooza')
  
  erb :index
end

get "/oauth/connect" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  # binding.pry
  redirect "/"
end
