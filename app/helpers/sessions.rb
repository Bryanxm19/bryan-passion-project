def current_user
  User.find(session[:user_id]) if session[:user_id]
end

def logged_in?
  !!current_user
end

def require_user
  if !logged_in?
    redirect '/users/login'
  end
end
