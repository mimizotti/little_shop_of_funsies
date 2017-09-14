class Category < ApplicationRecord
	has_many :items
	validates :title, presence: true
	validates :title, :slug, presence: true
	extend FriendlyId
  friendly_id :title, use: :slugged
end