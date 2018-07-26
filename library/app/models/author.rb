class Author < ApplicationRecord
	
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, uniqueness: true, presence: true, allow_blank: true
	validates :name,       presence: true
	validates :website,    presence: true, allow_blank: true
	validates :birth_date, presence: true, allow_blank: true

	has_many :books_authors, dependent: :destroy, inverse_of: :author
	has_many :books, through: :books_authors
	
	accepts_nested_attributes_for :books
	accepts_nested_attributes_for :books_authors, allow_destroy: true

end
