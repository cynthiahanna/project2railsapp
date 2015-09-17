json.array!(@meds) do |med|
  json.extract! med, :id, :title, :directions, :comments
  json.url med_url(med, format: :json)
end
