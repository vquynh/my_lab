json.extract! labor_item, :id, :title, :body, :created_at, :updated_at
json.url equipment_url(labor_item, format: :json)
