json.array!(@subcategories) do |subcategory|
  json.extract! subcategory, :id, :description
  json.url subcategory_url(subcategory, format: :json)
end
