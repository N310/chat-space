json.array! @latestMessage do |message|
  json.id message.id
  json.user_name  message.user.name
  json.created_at  message.created_at.strftime('%Y/%m/%d %H:%M')
  json.body  message.body
  json.image_url message.image_url(:thumb)
end
