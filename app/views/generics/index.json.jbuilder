json.array!(@generics) do |generic|
  json.extract! generic, :id, :name, :proof, :category
  json.url generic_url(generic, format: :json)
end
