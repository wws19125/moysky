json.array!(@theaders) do |theader|
  json.extract! theader, :user_id, :direction, :title, :_title, :heads, :items, :length, :intro, :type
  json.url theader_url(theader, format: :json)
end