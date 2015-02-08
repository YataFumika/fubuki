json.array!(@parkings) do |parking|
  json.extract! parking, :id, :address, :name, :photo, :user_id, :memo, :latitude, :longitude
  json.url parking_url(parking, format: :json)
end
