json.array!(@weibos) do |weibo|
  json.extract! weibo, :weiboid, :userid, :body, :pid, :btype
  json.url weibo_url(weibo, format: :json)
end