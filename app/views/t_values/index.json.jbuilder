json.page "1"
json.total 1000
json.records "30"
json.rows @theader.TValues do |tvalue|
json.id tvalue.id.to_s
items = tvalue.items.split("</?>")
json.cell items
end 

