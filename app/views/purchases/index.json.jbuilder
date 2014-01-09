json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :title, :description, :is_reproducible, :category
  json.url purchase_url(purchase, format: :json)
end
