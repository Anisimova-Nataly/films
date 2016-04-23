json.array!(@dvds) do |dvd|
  json.extract! dvd, :id, :cover_file_name, :cover_file_size, :cover_content_type, :cover_updated_at, :name, :price, :amount, :film_id
  json.url dvd_url(dvd, format: :json)
end
