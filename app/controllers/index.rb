get '/' do
  # render home page
  # TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user = User.find_by_email(params[:email])
  unless @user == nil
    if @user.password == params[:password]
      session[:id] = @user.id
      redirect '/'
    end
  end
  redirect '/sessions/new'
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  new_user = User.new(params["user"])
  new_user.save
  if !new_user.errors.empty?
    @errors = new_user.errors
    redirect '/users/new'
  end
  session[:id] = new_user.id
  redirect '/'
end
