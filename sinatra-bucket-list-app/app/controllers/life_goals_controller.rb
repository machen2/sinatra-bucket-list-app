class LifeGoalsController < ApplicationController

  get '/life_goals' do #index page
    @life_goals = LifeGoal.all
    erb :'/life_goals/index'
  end

  get '/life_goals/new' do
    erb :'/life_goals/new'
  end

  post '/life_goals' do
    @life_goal = LifeGoal.create(params[:life_goal])
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
    redirect :"/life_goals/#{@life_goal.id}"
  end
end
