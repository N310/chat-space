class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :messages
  accepts_nested_attributes_for :user_groups, allow_destroy: true

  validates :name, presence: true

  def get_latest_message
    latest_message = self.messages.order('created_at DESC').first
    if latest_message
      if latest_message.body != ""
        latest_message.body 
      elsif latest_message.image
        "画像が投稿されています"
      end
    else
      "まだメッセージはありません"
    end
  end
end
