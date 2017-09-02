require 'rails_helper'

describe Message do

  describe '#create' do
    it "is valid with a body of message" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end

    it "is valid with a image of message" do
      message = build(:message, body: "")
      expect(message).to be_valid
    end

    it "is valid with a bory and a image of message" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a bory and a image of message" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:base]).to include("メッセージを入力してください")
    end

    it "is invalid without group_id of message" do
      message = build(:message, group_id: "")
      message.valid?
      expect(message.errors[:group_id]).to include("グループIDを入力してください")
    end
  end
  
end
