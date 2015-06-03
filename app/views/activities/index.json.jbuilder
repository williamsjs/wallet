json.array!(@activities) do |activity|
  json.extract! activity, :id, :amount, :organization
  json.url activity_url(activity, format: :json)
end
