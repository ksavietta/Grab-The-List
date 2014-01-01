json.array!(@lists) do |list|
  json.extract! list, :id, :title, :description, :is_reproducible, :category
  json.url list_url(list, format: :json)
end
