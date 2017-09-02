require 'rails_helper'

describe Message do

  describe '#create' do
    it "is valid with a body of message" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid with a image of message" do
      message = build(:message)
      expect(message).to be_valid
    end
  end
  
end
