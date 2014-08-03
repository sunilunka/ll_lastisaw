get '/' do
  @reviews = Review.all.order(created_at: :desc).limit(3)
  @tags = []
  @reviews.each do |r|
    @tags << Instagram.tag_recent_media(r.event.artist.name.downcase.gsub(/[\W_]/,""))
  end
  erb :'index'
end
