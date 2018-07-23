class Librarian < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
	validates :mobile_no, length: { is:10 }, allow_blank: true, uniqueness: true, presence: true
	validates :name, presence: true
	validates :address, presence: true
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, presence: true, uniqueness: true

	has_many :book_issues, dependent: :destroy

end
