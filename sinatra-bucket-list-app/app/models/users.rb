class User < ActiveRecord::Base
  has_many :life_goals

  has_secure_password

  validates :name, :username, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: /@/, message: "address is invalid."}
  validates :password, presence: true, length: { minimum: 5 }
  validates :username, :email, uniqueness: true
end
