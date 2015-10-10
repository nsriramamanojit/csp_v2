json.array!(@roles) do |role|
  json.extract! role, :id, :name, :description, :reference_code, :status, :created_by, :modified_by
  json.url role_url(role, format: :json)
end
