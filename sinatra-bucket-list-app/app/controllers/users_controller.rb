class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(name: params[:name], username: params[:username], password: params[:password], email: params[:email])
    @user.save
    session[:user_id] = @user.id
    redirect to '/life_goals'
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/life_goals'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end
