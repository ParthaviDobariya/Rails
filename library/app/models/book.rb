class Book < ApplicationRecord

	validates :isbn_no,         presence: true, length: { is: 13 },     uniqueness: true
	validates :number_of_books, presence: true, length: { maximum: 4 }, allow_blank: true
	validates :pages, 			presence: true, length: { maximum: 5 }
	validates :title, 			presence: true
	validates :publish_date, 	presence: true
	
	belongs_to :publication

	has_one_attached :image
	
	has_many :book_issues, dependent: :destroy
	has_many :users, through: :book_issues
	
	has_many :books_authors, dependent: :destroy, inverse_of: :book	
	has_many :authors, through: :books_authors
	
	has_many :books_categories, dependent: :destroy
	has_many :categories, through: :books_categories

	accepts_nested_attributes_for :users
	accepts_nested_attributes_for :book_issues, allow_destroy: true

	accepts_nested_attributes_for :authors
	accepts_nested_attributes_for :books_authors, allow_destroy: true

	accepts_nested_attributes_for :categories
	accepts_nested_attributes_for :books_categories, allow_destroy: true

end