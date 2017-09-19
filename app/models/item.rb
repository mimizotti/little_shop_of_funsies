class Item < ApplicationRecord
	belongs_to :category
	has_many :order_items
	has_many :orders, through: :order_items
	validates :title      , :image, presence: true, uniqueness: true
	validates :description, :price, presence: true

	enum condition: ["active", "retired"]
end
