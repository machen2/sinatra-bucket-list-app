require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "application_secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!session[:user_id]
    end

    def set_life_goal
      @life_goal = LifeGoal.find_by(id: params[:id])
    end
  end

end
