class UsersController < ApplicationController
  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.new(name: params[:name], username: params[:username], password: params[:password], email: params[:email])
    @user.save
    session[:user_id] = @user.id
    redirect to '/life_goals'
  end
end
