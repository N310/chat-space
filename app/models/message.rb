class MessagesValidator < ActiveModel::Validator
  def validate(record)
    body = record.send(options[:messages][0])
    image_url = record.send(options[:messages][1]).url
    if body.blank? && image_url.blank?
      record.errors[:base] << "メッセージを入力してください"
    end
  end
end

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader
  validates_with MessagesValidator, messages: [:body, :image]
end
