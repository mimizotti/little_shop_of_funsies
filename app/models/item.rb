class Item < ApplicationRecord
<<<<<<< HEAD
=======
	belongs_to :category
>>>>>>> 0e49b75e751501f30b2bade41d930fab4e62078f
	validates :title      , :image, presence: true, uniqueness: true
	validates :description, :price, presence: true
end