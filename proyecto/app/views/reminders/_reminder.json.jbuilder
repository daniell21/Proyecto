json.extract! reminder, :id, :name, :frecuency, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
