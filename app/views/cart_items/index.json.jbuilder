json.array!(@cart_items) do |cart_item|
  json.extract! cart_item, :id, :price, :amount, :integer, :dvd_id, :basket_id
  json.url cart_item_url(cart_item, format: :json)
end
