json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :description, :proof, :rating, :generic_id
  json.url ingredient_url(ingredient, format: :json)
end
