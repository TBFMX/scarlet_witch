json.array!(@historial_de_compras) do |historial_de_compra|
  json.extract! historial_de_compra, :id, :nombre_generico, :description, :cantidad, :unidad, :precio, :multiplicador, :category_id, :origen
  json.url historial_de_compra_url(historial_de_compra, format: :json)
end
