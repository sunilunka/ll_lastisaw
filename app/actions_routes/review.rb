# get '/artist/:id/event/:id/review' do
#   erb :'artist/event/review'
# end


get '/event/review/new' do
  # @event = Event.new
  erb :'event/review/new'
end

post '/event/review/new' do
  # @event = Event.new(
  #   date: params[:date],
  #   venue: params [:venue],
  #   artist_id: params[:artist_id]
  #   )

  redirect '/artist/:id'
  # erb :'artist/event/review/new
end