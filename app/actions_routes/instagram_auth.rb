# Instagram callback URL
CALLBACK_URL = "http://localhost:3000/oauth/callback"

get "/oauth/connect" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/oauth/callback" do
  begin
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    @user = User.find_by(insta_username: response.user.username, insta_access_token: response.access_token)
    if @user
      session[:user_id] = @user.id
    else
      @user = User.find_by(insta_username: response.user.username)
      if @user
        @user.update(insta_access_token: response.access_token)
        session[:user_id] = @user.id
      else
        @user = User.new(insta_username: response.user.username, insta_access_token: response.access_token)
        @user.save
        session[:user_id] = @user.id
      end
    end
  rescue Instagram::BadRequest => e
    puts e.message
    e.backtrace.each do |b|
      puts b
    end
  end
  redirect request.referrer
end

post "/logout" do
  session[:user_id] = nil
  redirect "/"
end
