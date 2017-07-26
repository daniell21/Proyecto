json.extract! client_mail, :id, :title, :body, :destinatary, :created_at, :updated_at
json.url client_mail_url(client_mail, format: :json)
