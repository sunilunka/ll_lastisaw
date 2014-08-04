get '/artist/search' do
  @artist = Artist.find_by(name: params[:artist_search_term].upcase)

  if @artist
    redirect "/artist/#{@artist.id}"
  else 
    redirect '/not_found'
  end
end

get '/artist/:id' do
  begin
    @artist = Artist.find(params[:id])
    @events = @artist.events.order(date: :desc)
    @tags = Instagram.tag_recent_media("#{@artist.name.downcase.gsub(/[\W_]/,"")}")
    erb :'/artist/artist'
  rescue
    redirect '/not_found'
  end
end

get '/artist/:id/review/new' do
  begin
    @artist = Artist.find(params[:id])
    @event = Event.new
    # @review = Review.new
    erb :'/review/new'
  rescue
    redirect '/not_found'
  end
end
