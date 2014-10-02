json.array!(@articulos) do |articulo|
  json.extract! articulo, :id, :title, :tipo, :tiempo_preparacion, :descripcion
  json.url articulo_url(articulo, format: :json)
end
