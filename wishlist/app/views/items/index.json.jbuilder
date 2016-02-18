json.array!(@items) do |item|
  json.extract! item, :id, :name, :max_price, :notes, :model_number, :url
  json.url list_item_url(item.list, item, format: :json)
end
