json.array!(@entries) do |entry|
  json.extract! entry, :id, :MerchantId, :Amount
  json.url entry_url(entry, format: :json)
end
