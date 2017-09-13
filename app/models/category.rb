class Category < ApplicationRecord
	has_many :items
	validates :title, presence: true
	
	def to_param
		title.parameterize
	end
end