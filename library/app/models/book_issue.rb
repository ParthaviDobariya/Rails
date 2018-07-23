class BookIssue < ApplicationRecord
	
	belongs_to :book
	belongs_to :user
	belongs_to :librarian

	validates :issue_date, presence: true
	validates :return_date, presence: true

end
