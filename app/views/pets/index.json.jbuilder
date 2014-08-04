json.array!(@pets) do |pet|
  json.extract! pet, :id, :type, :name, :photo, :size, :household_id, :allergies, :vet_id, :age, :feeding, :notes, :behavior_id, :supply_id
  json.url pet_url(pet, format: :json)
end
