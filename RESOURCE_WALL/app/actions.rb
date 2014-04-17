# Homepage (Root path)
helpers do
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/resources' do
  @resources = Resource.all
  erb :'resources/index'
end

get '/resources/new' do
  @resource = Resource.new
  erb :'resources/new'
end

post '/resources' do
  @resource = Resource.new(params)
  @resource.user = current_user #adds this to the hash
  if @resource.save
    redirect '/resources'
  else
    erb :'resources/new'
  end
end

#Authentication Actions

get '/sign_up' do
  erb :'auth/sign_up'
end

post '/sign_up' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
    )

  if @user.save
     session[:user_id] = @user.user_id
     redirect '/'
  else
    erb :'auth/signup'
  end
end

get '/log_in' do
  erb :'auth/log_in'
end

post '/log_in' do
  @user = User.find_by(
    email: params[:email],
    password: params[:password]
    )
  if @user 
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'auth/log_in'
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end