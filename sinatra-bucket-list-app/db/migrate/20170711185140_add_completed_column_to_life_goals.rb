class AddCompletedColumnToLifeGoals < ActiveRecord::Migration
  def change
    add_column :life_goals, :completed, :boolean, :default => false
  end
end
