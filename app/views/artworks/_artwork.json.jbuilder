json.extract! artwork, :id, :title, :description, :active, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
