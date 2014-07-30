get '/artist' do
  @artist = Artist.new
  erb :'artist/index'
end