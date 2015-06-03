json.array!(@users) do |user|
  json.extract! user, :id, :activity_id
  json.url user_url(user, format: :json)
end
