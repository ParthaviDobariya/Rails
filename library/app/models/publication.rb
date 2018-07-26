class Publication < ApplicationRecord
	
	has_many :books, dependent: :destroy, inverse_of: :publication
	
	accepts_nested_attributes_for :books, allow_destroy: true, reject_if: :all_blank

	validates :name,    presence: true, uniqueness: true
	validates :address, presence: true
	validates :website, presence: true
	
end
