json.array!(@orders) do |order|
  json.extract! order, :id, :client_id, :fecha_pedido, :tipo_pago, :tipo_entrega, :fecha_entrega, :status
  json.url order_url(order, format: :json)
end
