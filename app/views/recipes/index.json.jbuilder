json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :nombre, :recipe_procidure_id, :recipe_ingredient_id, :recipe_materials_id, :tiempo_preparacion
  json.url recipe_url(recipe, format: :json)
end
