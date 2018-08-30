require 'rails_helper'

RSpec.describe Book, type: :model do
  it {is_expected.to validate_uniqueness_of(:isbn_no)}
	it {is_expected.to validate_presence_of(:isbn_no)}
	it {is_expected.to validate_length_of(:isbn_no)}
  it {is_expected.to validate_presence_of(:number_of_books)}
  it {is_expected.to allow_value("", nil).for(:number_of_books)}
  it {is_expected.to validate_length_of(:number_of_books)}
  it {is_expected.to validate_presence_of(:title)}
  it {is_expected.to validate_presence_of(:pages)}
  it {is_expected.to validate_length_of(:pages)}
  it {is_expected.to allow_value("", nil).for(:pages)}
  it {is_expected.to validate_presence_of(:publish_date)}
  
  it {is_expected.to have_many(:book_issues)}
  it {is_expected.to have_many(:users)}
  it {is_expected.to have_many(:books_authors)}
  it {is_expected.to have_many(:authors)}
  it {is_expected.to have_many(:books_categories)}
  it {is_expected.to have_many(:categories)}
  it {is_expected.to have_many(:books_shops)}
  it {is_expected.to have_many(:shops)}

  it {is_expected.to belong_to(:publication)}
  it {is_expected.to accept_nested_attributes_for(:books_authors)}
  it {is_expected.to accept_nested_attributes_for(:books_categories)}
  it {is_expected.to accept_nested_attributes_for(:books_shops)}

end
