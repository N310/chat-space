class MessagesValidator < ActiveModel::Validator
  def validate(record)
    if options[:messages].any?{|message| record.send(message) == "" }
      record.errors[:base] << "メッセージを入力してください"
    end
  end
end

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates_with MessagesValidator, messages: [:body, :image]
end
