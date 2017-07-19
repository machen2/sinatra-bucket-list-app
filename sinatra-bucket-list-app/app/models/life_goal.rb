class LifeGoal < ActiveRecord::Base
  belongs_to :user

  validates :title, :location, :summary, :description, presence: true
  validates :summary, length: { maximum: 40 }

  def update_and_reset_reflection(attributes)
    if attributes[:completed] == false
      attributes[:reflection] = nil
    end
    self.update(attributes)
  end
end
