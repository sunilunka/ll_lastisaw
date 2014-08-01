get '/review/new' do
  @review = Review.new
  erb :'/review/new'
end

post '/review/new' do
  find_artist = Artist.find_by(name: params[:artist])
  find_event = Event.find_by(date: params[:date], city_name: params[:city_name])

  if find_artist
    if find_event
      @review = Review.new(
        event_id: find_event.id,
        review: params[:review],
      )
      @review.user_id = current_user.id if current_user
      @review.save

      redirect "/artist/#{find_artist.id}"
    else
      @event = Event.create(
        date: params[:date],
        city_name: params[:city_name],
        artist_id: find_artist.id
      )

      @review = Review.new(
        event_id: @event.id,
        review: params[:review],
      )
      @review.user_id = current_user.id if current_user
      @review.save

      redirect "/artist/#{find_artist.id}"
    end
  else
    @artist = Artist.create(
      name: params[:artist]
    )

    @event = Event.create(
      date: params[:date],
      city_name: params[:city_name],
      artist_id: @artist.id
    )

    @review = Review.new(
      event_id: @event.id,
      review: params[:review],
    )
    @review.user_id = current_user.id if current_user
    @review.save

    redirect "/artist/#{@artist.id}"
  end
end
