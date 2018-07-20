json.extract! book, :id, :isbn_no, :title, :number_of_books, :publish_date, :pages, :created_at, :updated_at
json.url book_url(book, format: :json)
