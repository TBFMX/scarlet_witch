json.array!(@materials) do |material|
  json.extract! material, :id, :nombre, :unidad, :consumible, :disponibles
  json.url material_url(material, format: :json)
end
