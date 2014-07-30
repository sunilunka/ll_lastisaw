# Event Page root

get '/event' do 
  # @reviews = Review.all 
  erb :'event/index'
end

get '/event/new' do
  @event = Event.new
  erb :'event/new'
end

post '/event/new' do
  @event = Event.new(
    date: params[:date],
    venue: params [:venue],
    artist_id: params[:artist_id]
    )

  redirect 'event/'
end
