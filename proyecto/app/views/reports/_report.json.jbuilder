json.extract! report, :id, :title, :content, :image, :created_at, :updated_at
json.url report_url(report, format: :json)
