class Order < ApplicationRecord
  belongs_to :user
  validates :status, presence: true
  has_many :order_items
  has_many :items, through: :order_items
  
  enum status: ["ordered", "paid", "cancelled", "completed"]
  
  def total_price
    items.sum(:price)
  end
end
