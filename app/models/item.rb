class Item < ApplicationRecord
	belongs_to :category
	has_many :order_items
	has_many :orders, through: :order_items
	validates :title     ,  presence: true, uniqueness: true
	validates :description, :price, presence: true
	has_attached_file :image,
	:default_url => '/images/missing.jpg', styles: {thumb: "68x68#", medium: "300x300#"},
	:path => ":rails_root/public/images/:id/:style/:filename",
  :url => "/images/:id/:style/:filename"
	validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']
	enum condition: ["active", "retired"]


	def self.total_sold_by_item
		group(:title).joins(:order_items).sum(:quantity)
	end

	def self.items_by_title_with_status
		group(:title).joins(:orders).group(:status).count
	end

end
