class AddReflectionToLifeGoals < ActiveRecord::Migration
  def change
    add_column :life_goals, :reflection, :string
  end
end
