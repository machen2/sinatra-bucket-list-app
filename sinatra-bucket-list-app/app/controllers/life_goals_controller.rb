class LifeGoalsController < ApplicationController

  get '/life_goals' do #index page
    @life_goals = LifeGoal.all
    erb :'/life_goals/index'
  end


end
