json.array!(@users) do |user|
  json.extract! user, :passport, :dname, :password, :config
  json.url user_url(user, format: :json)
end