get '/artist/search' do
  @artist = Artist.find_by(name: params[:artist_search_term].upcase)
  
  if @artist
    redirect "/artist/#{@artist.id}"
  else 
    redirect '/not_found'
  end
end

get '/artist/:id' do
    @artist = Artist.find(params[:id])
    @events = @artist.events.order(date: :desc)
    @tags = Instagram.tag_recent_media("#{@artist.name.downcase.gsub(/[\W_]/,"")}")
    erb :'artist/artist'
end
