json.extract! publication, :id, :name, :address, :website, :created_at, :updated_at
json.url publication_url(publication, format: :json)
