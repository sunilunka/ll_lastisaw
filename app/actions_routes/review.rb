get '/review/new' do
  @event = Event.new
  # @review = Review.new
  erb :'/review/new'
end

post '/review/new' do
  find_artist = Artist.find_by(name: params[:artist].upcase)
  find_event = Event.find_by(date: params[:date], city_name: params[:city_name], artist_id: find_artist.id) if find_artist

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
      @event = Event.new(
        date: params[:date],
        city_name: params[:city_name],
        artist_id: find_artist.id
      )

      if @event.save
        @review = Review.new(
          event_id: @event.id,
          review: params[:review],
        )
        @review.user_id = current_user.id if current_user
        @review.save

        redirect "/artist/#{find_artist.id}"
      else
        erb :'/review/new'
      end
    end
  else
    @artist = Artist.new(
      name: params[:artist].upcase
    )

    if @artist.save
      @event = Event.new(
        date: params[:date],
        city_name: params[:city_name],
        artist_id: @artist.id
      )

      if @event.save
        @review = Review.new(
          event_id: @event.id,
          review: params[:review],
        )
        @review.user_id = current_user.id if current_user
        @review.save

        redirect "/artist/#{@artist.id}"
      else 
        erb :'/review/new'
      end
    else
      erb :'/review/new'
    end
  end
end
