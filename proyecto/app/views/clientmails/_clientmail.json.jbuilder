json.extract! clientmail, :id, :title, :body, :client_id, :created_at, :updated_at
json.url clientmail_url(clientmail, format: :json)
