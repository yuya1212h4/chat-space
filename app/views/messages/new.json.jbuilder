@messages = @group.messages.where('id > ?', params[:last_message_id])
json.(@messages) do |message|
  json.id message.id
  json.name message.user.name
  json.body message.body
  json.created_at message.created_at
  json.image message.image.url
end
