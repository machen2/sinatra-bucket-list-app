class User < ActiveRecord::Base
  has_many :life_goals

  has_secure_password
end
