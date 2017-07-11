class LifeGoal < ActiveRecord::Base
  belongs_to :user

  validates :title, :location, :summary, :description, presence: true
  validates :summary, length: { maximum: 40 }

  def reset_reflection
    if self.completed == false
      self.reflection = nil
    end
  end
end
