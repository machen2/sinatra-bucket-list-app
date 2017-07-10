class LifeGoalsController < ApplicationController

  get '/life_goals' do #index page
    @life_goals = current_user.life_goals
    erb :'/life_goals/index'
  end

  get '/life_goals/new' do
    erb :'/life_goals/new'
  end

  post '/life_goals' do
    @life_goal = LifeGoal.create(params[:life_goal])
    @life_goal.user_id = session[:user_id]
    @life_goal.save
    erb :'/life_goals/show'
  end

  get '/life_goals/:id' do #show page
    @life_goal = LifeGoal.find_by(id: params[:id])
    erb :'/life_goals/show'
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
