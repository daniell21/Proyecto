json.extract! client_mail, :id, :title, :body, :date, :client_id, :created_at, :updated_at
json.url client_mail_url(client_mail, format: :json)
