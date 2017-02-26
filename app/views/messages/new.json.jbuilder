json.(@group.messages) do |message|
  json.name message.user.name
  json.body message.body
  json.created_at message.created_at
  json.image message.image.url
end
