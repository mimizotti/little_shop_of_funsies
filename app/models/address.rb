class Address < ApplicationRecord
  belongs_to :user
  validates :street, :city, :state, :zip, presence: true

  def complete_address
    street + ", " + city + ", " + state + ", " + zip
  end
end
