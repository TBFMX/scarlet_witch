json.array!(@comandas) do |comanda|
  json.extract! comanda, :id, :articulo_id, :order_id
  json.url comanda_url(comanda, format: :json)
end
