class Item < ApplicationRecord
	validates :title      , :image, presence: true, uniqueness: true
	validates :description, :price, presence: true
end