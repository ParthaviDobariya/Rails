class Shop < ApplicationRecord
	validates :name, :address,  presence: true

	geocoded_by :address
	after_validation :geocode, if: :address_changed? 

	has_many :books_shops, dependent: :destroy
	has_many :books, through: :books_shops
end
