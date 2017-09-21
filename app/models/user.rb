class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: ["default", "admin"]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.address = "1331 17th St ll100, Denver, CO 80202"
      user.password = 'jeffcasimir'
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save
    end
  end

  def full_name
    first_name + " " + last_name
  end

  def date_joined
    created_at.strftime('%b. %d, %Y')
  end

  def self.user_orders
    group(:email).joins(:orders).count
  end

  def self.user_quantity_of_items_ordered
    group(:email).joins(orders: :order_items).sum(:quantity)
  end
end
