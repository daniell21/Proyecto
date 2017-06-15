json.extract! payment, :id, :name, :description, :proof, :created_at, :updated_at
json.url payment_url(payment, format: :json)
