class Book < ApplicationRecord

	validates :isbn_no, presence: true, length: { is: 13 }, uniqueness: true
	validates :number_of_books, presence: true, length: { maximum: 4 }
	validates :pages, length: { maximum: 5 }, presence: true
	validates :title, presence: true
	validates :publish_date, presence: true
	
	belongs_to :publication
	has_many :book_issues, dependent: :destroy
	has_many :users, through: :book_issues
	has_many :books_authors, dependent: :destroy
	has_many :authors, through: :books_authors
	has_many :books_categories, dependent: :destroy
	has_many :categories, through: :books_categories

end
