json.array!(@households) do |household|
  json.extract! household, :id, :address, :key_info
  json.url household_url(household, format: :json)
end
