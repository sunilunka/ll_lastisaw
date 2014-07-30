get '/artist' do
  # @artist = Artist.new
  erb :'/artist/index'
end

# get '/artist/:id' do
#   # populate and array based on the number of events, sort by
#   # most recent first. 
#   erb :'artist/:id'
# end

get '/artist/new' do
  erb :'/artist/new'
end

post '/artist/new' do
  erb :'/artist/new'
end
