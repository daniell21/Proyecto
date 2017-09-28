json.array! @clients do |client|
  json.(client, :id, :name)
end