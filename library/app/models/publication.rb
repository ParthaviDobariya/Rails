class Publication < ApplicationRecord
	
	has_many :books

	validates :name, presence: true, uniqueness: true
	validates :address, presence: true
	validates :website, presence: true
	
end
