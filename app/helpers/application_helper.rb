module ApplicationHelper

  def get_newmessage(belong_group)
    new_message = belong_group.messages.order('created_at DESC').first
    if new_message
      if new_message.body
        return  new_message.body 
      elsif new_message.image
        return "画像が投稿されています"
      end
    else
      return "まだメッセージはありません"
    end
  end

end
