json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :nombre, :unidad, :yield
  json.url ingredient_url(ingredient, format: :json)
end
