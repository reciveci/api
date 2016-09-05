json.array!(@sectors) do |sector|
  json.extract! sector, :id, :name, :enabled, :city_id
  json.url sector_url(sector, format: :json)
end
