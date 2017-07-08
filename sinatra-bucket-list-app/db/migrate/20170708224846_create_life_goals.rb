class CreateLifeGoals < ActiveRecord::Migration
  def change
    create_table :life_goals do |t|
      t.string :title
      t.string :summary
      t.string :description
      t.string :location
      t.integer :user_id
    end
  end
end
