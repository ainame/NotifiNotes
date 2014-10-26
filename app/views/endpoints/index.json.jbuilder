json.array!(@endpoints) do |endpoint|
  json.extract! endpoint, :id, :user_id, :platform, :arn
  json.url endpoint_url(endpoint, format: :json)
end
