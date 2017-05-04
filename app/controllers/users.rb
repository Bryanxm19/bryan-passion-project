get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.create(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Username or Password is invalid"]
    erb :'users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end
