class Category < ApplicationRecord

	validates :name, presence: true
	
	has_many :books_categories, dependent: :destroy
	has_many :books, through: :books_categories
	
	accepts_nested_attributes_for :books
	accepts_nested_attributes_for :books_categories, allow_destroy: true

end
