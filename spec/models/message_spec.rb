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
  end
  
end
