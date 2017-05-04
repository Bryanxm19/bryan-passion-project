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
