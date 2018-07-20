json.extract! author, :id, :name, :birth_date, :email, :website, :created_at, :updated_at
json.url author_url(author, format: :json)
