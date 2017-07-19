class LifeGoalsController < ApplicationController

  get '/life_goals' do
    if logged_in?
      @life_goals = current_user.life_goals
      erb :'/life_goals/index'
    else
      redirect to '/login'
    end
  end

  get '/life_goals/new' do
    if logged_in?
      erb :'/life_goals/new'
    else
      redirect to '/login'
    end
  end

  post '/life_goals' do
    if logged_in?
      @life_goal = LifeGoal.new(params[:life_goal])
      if @life_goal.save
        @life_goal.user_id = session[:user_id]
        @life_goal.save
        erb :'/life_goals/show'
      else
        flash[:errors] = @life_goal.errors.full_messages
        redirect to '/life_goals/new'
      end
    else
      redirect_to '/login'
    end
  end

  get '/life_goals/:id' do
    if logged_in?
      set_life_goal
      if @life_goal && @life_goal.user == current_user
        erb :'/life_goals/show'
      else
        redirect to '/life_goals'
      end
    else
      redirect to '/login'
    end
  end

  get '/life_goals/:id/edit' do
    if logged_in?
      set_life_goal
      if @life_goal && @life_goal.user == current_user
        erb :'/life_goals/edit'
      else
        redirect to '/life_goals'
      end
    else
      redirect to '/login'
    end
  end

  patch '/life_goals/:id' do
    if logged_in?
      set_life_goal
      if @life_goal.update_and_reset_reflection(params[:life_goal])
        redirect to "/life_goals/#{@life_goal.id}"
      else
        redirect to "/life_goals/#{@life_goal.id}/edit"
      end
    else
      redirect_to '/login'
    end
  end

  delete '/life_goals/:id/delete' do
    if logged_in?
      set_life_goal
      if @life_goal && (current_user == @life_goal.user)
        @life_goal.delete
      end
      redirect to '/life_goals'
    else
      redirect_to '/login'
    end
  end

  private
    def set_life_goal
      @life_goal = LifeGoal.find_by(id: params[:id])
    end
end
