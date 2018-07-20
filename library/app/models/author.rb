class Author < ApplicationRecord
validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	has_many :books_authors, dependent: :destroy
	has_many :books, through: :books_authors
end
