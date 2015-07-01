json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :description, :slug
  json.url room_url(room, format: :json)
end
