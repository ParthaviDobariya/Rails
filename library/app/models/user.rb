class User < ApplicationRecord
	
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, presence: true, uniqueness: true
	validates :mobile_no, presence: true, length: { is:10 }, numericality: true, uniqueness: true
	validates :name,  	  presence: true
	validates :address,   presence: true
	
	has_many :book_issues
	has_many :books, through: :book_issues
	
	accepts_nested_attributes_for :books
	accepts_nested_attributes_for :book_issues, allow_destroy: true

end
