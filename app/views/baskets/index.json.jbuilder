json.array!(@baskets) do |basket|
  json.extract! basket, :id, :status, :type_of_delivery, :integer, :address, :text, :user_id
  json.url basket_url(basket, format: :json)
end
