class BookIssue < ApplicationRecord
	
	belongs_to :book
	belongs_to :user
	belongs_to :librarian

	validates :issue_date,  presence: true
	validates :return_date, presence: true

	accepts_nested_attributes_for :user, reject_if: :all_blank

end
