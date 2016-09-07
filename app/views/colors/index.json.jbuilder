json.array!(@colors) do |color|
  json.extract! color, :id, :nombre, :codigo
  json.url color_url(color, format: :json)
end
