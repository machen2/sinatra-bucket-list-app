class User < ActiveRecord::Base
  has_many :life_goals

  has_secure_password

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, length: { minimum: 5 }, format: { with: /@/, message: "Invalid email address."}
  validates :username, presence: true, length: { minimum: 4 }
  validates :password, presence: true, length: { minimum: 5 }
  validates :username, uniqueness: {message: "This username has already been taken."}
end
