require 'rails_helper'

RSpec.describe Author, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe Author do

  	invalid_emails = ["abc@gmail", "@gmail", "@gmail.com", "abc.com", "a.co", " "]
		invalid_emails.each do |s|
		  it { is_expected.to_not allow_value(s).for(:email) }
		end

		it { is_expected.to validate_uniqueness_of(:email) }
  	it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:website) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to have_many(:books_authors) }
    it { is_expected.to have_many(:books) }
	end
end
