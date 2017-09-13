class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: ["default", "admin"]
end
