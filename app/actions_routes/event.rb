# Event Page root

get '/artist/:id/event' do 
  # @reviews = Review.all 
  erb :'artist/event/index'
end

post '/artist/:id/event' do
  
end

get '/artist/:id/event/new' do

end

# get '/artist/event/review/new' do
#   # @event = Event.new
#   erb :'artist/event/review/new'
# end

# post '/artist/event/review/new' do
#   # @event = Event.new(
#   #   date: params[:date],
#   #   venue: params [:venue],
#   #   artist_id: params[:artist_id]
#   #   )

#   # redirect 'event/:id'
#   erb :'artist/event/review/new'
# end
