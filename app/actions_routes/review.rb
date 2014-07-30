get '/artist/:id/event/:id/review' do
  erb :'artist/event/review'
end


get '/artist/:id/event/:id/review/new' do
  # @event = Event.new
  erb :'artist/event/review/new'
end

post '/artist/event/review/new' do
  # @event = Event.new(
  #   date: params[:date],
  #   venue: params [:venue],
  #   artist_id: params[:artist_id]
  #   )

  # redirect 'event/:id'
  erb :'artist/event/review/new'
end