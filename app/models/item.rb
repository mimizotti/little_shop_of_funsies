class Item < ApplicationRecord
	belongs_to :category
	has_many :order_items
	has_many :orders, through: :order_items
	validates :title     ,  presence: true, uniqueness: true
	validates :description, :price, presence: true
	has_attached_file :image, default_url: File.new("./app/assets/images/missing.jpg")
	validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/gif', 'image/png']
	enum condition: ["active", "retired"]
end
