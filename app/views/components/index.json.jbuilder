json.array!(@components) do |component|
  json.extract! component, :id, :amount, :ingredient_id, :cocktail_id
  json.url component_url(component, format: :json)
end
