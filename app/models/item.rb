class Item < ApplicationRecord
	belongs_to :category
	validates :title      , :image, presence: true, uniqueness: true
	validates :description, :price, presence: true
end