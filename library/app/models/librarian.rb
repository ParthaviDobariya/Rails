class Librarian < ApplicationRecord
	validates :mobile_no, length: { is:10  }
end
