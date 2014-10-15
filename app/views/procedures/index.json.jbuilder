json.array!(@procedures) do |procedure|
  json.extract! procedure, :id, :nombre, :instrucciones
  json.url procedure_url(procedure, format: :json)
end
