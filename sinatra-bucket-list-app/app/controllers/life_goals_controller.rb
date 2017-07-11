class LifeGoalsController < ApplicationController

  get '/life_goals' do #index page
    if logged_in?
      @life_goals = current_user.life_goals
      erb :'/life_goals/index'
    else
      redirect to '/'
    end
  end

  get '/life_goals/new' do
    if logged_in?
      erb :'/life_goals/new'
    else
      redirect to '/'
    end
  end

  post '/life_goals' do
    @life_goal = LifeGoal.create(params[:life_goal])
    @life_goal.user_id = session[:user_id]
    @life_goal.save
    erb :'/life_goals/show'
  end

  get '/life_goals/:id' do #show page
    @life_goal = LifeGoal.find_by(id: params[:id])
    if logged_in? && (current_user.id == @life_goal.user_id)
      erb :'/life_goals/show'
    else
      redirect to '/life_goals'
    end
  end

  get '/life_goals/:id/edit' do #edit page
    @life_goal = LifeGoal.find_by(id: params[:id])
    erb :'/life_goals/edit'
  end

  patch '/life_goals/:id' do
    @life_goal = LifeGoal.find_by(id: params[:id])
    @life_goal.update(params[:life_goal])
    redirect to "/life_goals/#{@life_goal.id}"
  end

  delete '/life_goals/:id/delete' do #delete action
    @life_goal = LifeGoal.find_by(id: params[:id])
    @life_goal.delete
    redirect to '/life_goals'
  end
end
