class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true, uniqueness: true
  
  enum role: ["default", "admin"]

  def full_name
    first_name + " " + last_name
  end

  def date_joined
    created_at.strftime('%b. %d, %Y')
  end

end
