json.extract! report, :id, :title, :memo, :author, :created_at, :updated_at
json.url report_url(report, format: :json)
