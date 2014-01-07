json.array!(@groups) do |group|
  json.extract! group, :id, :title, :description, :is_reproducible, :category
  json.url group_url(group, format: :json)
end
