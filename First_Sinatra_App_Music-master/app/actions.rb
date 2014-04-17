# Homepage (Root path)
#workflow. The glue between erb and business logic.

helpers do
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.top_10
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end


post '/songs' do
  @song = Song.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url]
  )

  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/songs/:id' do
  @song = Song.find params[:id]
  @songs = Song.all.where( author: @song.author)
  @ratings = @song.ratings
  @rating = Rating.new
  erb :'songs/show'
end

##Authentication Actions
get '/login' do
  erb :'auth/login'
end

get '/signup' do
  erb :'auth/signup'
end

post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'auth/login'
  end
end

post '/signup' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'auth/signup'
  end
end

post '/upvote' do
  @upvote = Upvote.create(
    user_id: current_user.id,
    song_id: params[:song_id]
  )

  redirect '/songs'
end

post '/downvote' do
  vote = Upvote.find_by(
    user_id: current_user.id,
    song_id: params[:song_id]
  )

  vote.delete unless vote.nil?

  redirect '/songs'
end

post '/ratings' do
  @rating = Rating.create(
    user_id: current_user.id,
    song_id: params[:song_id],
    stars: params[:stars],
    review: params[:review]
  )
  redirect "/songs/#{@rating.song_id}"
end

post '/delete_ratings' do
  song_id = params[:song_id]
  rating_to_delete = Rating.find_by(
    user_id: current_user.id,
    song_id: song_id 
  )
  rating_to_delete.destroy unless rating_to_delete.nil?

  redirect "/songs/#{song_id}"
end


post '/logout' do
  @current_user
  session[:user_id] = nil
  redirect '/'
end



#database communications logic