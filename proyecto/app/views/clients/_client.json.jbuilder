json.extract! client, :id, :name, :lastname, :created_at, :updated_at
json.url client_url(client, format: :json)
