require 'rails_helper'
describe Message, type: :model do
  describe '#create' do
    it "is effective with a message" do
      message = build(:message)
      expect(message).to be_valid
    end
    it "is invalid without a message" do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end
  end
end
