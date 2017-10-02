json.extract! apiuser, :id, :email, :password, :created_at, :updated_at
json.url apiuser_url(apiuser, format: :json)
