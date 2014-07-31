# get '/artist/:id/event/:id/review' do
#   erb :'artist/event/review'
# end


get '/event/review/new' do
  # @event = Event.new
  erb :'event/review/new'
end

post '/event/review/new' do
  
  @date = params[:date]
  @event = params[:event_city].downcase
  @artist = params[:artist].downcase

  find_artist = Artist.find_by name: @artist
  find_event = Event.where("date = ? AND (city_name LIKE ?)", @date, @event)


  
  if find_artist && find_event.first
    @review = Review.new(
      date: find_event.date,
      event_id: find_event.first.id,
      # artist_id: find_artist.id
    )
  elsif find_artist
    @event = Event.new(
        date: @date,
        city_name: @event,
        artist_id: find_artist.first.id
    )  

    @review = Review.new(
      date: @date,
      event_id: Event.last.id
      # artist_id: find_artist.first.id,
    )


  else 
    @new_artist = Artist.new(
      name: @artist
    ) 

    @event = Event.new(
      date: @date,
      city_name: @event
      artist_id: Artist.last
    )

    @review = Review.new(
      date: @date,
      event_id: Event.last.id
      # artist_id: Artist.last.id
    )
  end

  redirect "/artist/#{find_artist.id}"
  # erb :'artist/event/review/new
end