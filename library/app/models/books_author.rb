class BooksAuthor < ApplicationRecord

  belongs_to :book, optional: true
  belongs_to :author, optional: true

  validates_uniqueness_of :book_id, scope: [:author_id]

end
