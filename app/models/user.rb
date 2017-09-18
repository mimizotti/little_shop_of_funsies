class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :addresses
  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: ["default", "admin"]
end
