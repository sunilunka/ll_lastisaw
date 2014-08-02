get '/artist/search' do
  @artist = Artist.find_by(name: params[:artist_search_term])
  redirect "/artist/#{@artist.id}"
end

get '/artist/:id' do
    @artist = Artist.find(params[:id])
    @events = @artist.events.order(date: :desc)
    @tags = Instagram.tag_recent_media("#{@artist.name.downcase.gsub(/[\W_]/,"")}")
    erb :'artist/artist'
end