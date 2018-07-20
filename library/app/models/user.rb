class User < ApplicationRecord
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :mobile_no, length: { is:10  }
	has_many :book_issues
	has_many :books, through: :book_issues
end
