get '/users/login' do
  erb :login
end

post '/users/login' do
  login
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/signup' do
  # @user = User.new
  erb :signup
end

post '/users/signup' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  unless @user.save
    erb :signup
  else
    login
  end
end

get '/users/profile' do
  @user = current_user
  @surveys = @user.surveys
  erb :profile
end
