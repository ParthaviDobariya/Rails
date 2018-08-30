class BooksShop < ApplicationRecord
  belongs_to :book
  belongs_to :shop

  validates_uniqueness_of :book_id, scope: :shop_id
end
