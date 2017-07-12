class UsersController < ApplicationController
  get '/signup' do
    if logged_in?
      redirect to '/life_goals'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    @user = User.new(name: params[:name], username: params[:username], password: params[:password], email: params[:email])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/life_goals'
    else
      flash[:errors] = @user.errors.full_messages
      redirect to '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/life_goals'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/life_goals'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/'
    else
      redirect to '/login'
    end
  end
end
