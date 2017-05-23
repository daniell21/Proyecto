json.extract! mailreminder, :id, :title, :body, :created_at, :updated_at
json.url mailreminder_url(mailreminder, format: :json)
