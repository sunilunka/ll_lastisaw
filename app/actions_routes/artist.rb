get '/artist/:id' do
  # populate and array based on the number of events, sort by
  # most recent first. 
  erb :'artist/:id'
end

# post '/artist' do
#   # @artist = Artist.where("artist = ?", params[:artist])
#   # if @artist[0]
#   #   redirect "/artist/#{@artist[0].id}"
#   # else
#   #   redirect '/artist/new'
#   # end
# end

# get '/artist/new' do
#   erb :'/artist/new'
# end

# post '/artist/new' do
#   erb :'/artist/new'
# end

