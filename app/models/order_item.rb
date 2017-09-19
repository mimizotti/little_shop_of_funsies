class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :item

	def self.sum_quantity
		group(:item_id)
	end
end
