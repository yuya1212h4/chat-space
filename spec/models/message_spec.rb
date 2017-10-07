require 'rails_helper'

describe Message, type: :model do
  context "with valid attributes" do
    it "is effective with a message" do
      message = build(:message)
      expect(message).to be_valid
    end
  end

  context "with invalid attributes" do
    it "is invalid without a message" do
      message = build(:message, body: "")
      message.valid?
      expect(message).to be_valid
    end

    it "is invalid without a image" do
      message = build(:message, image: "")
      message.valid?
      expect(message).to be_valid
    end

  end

  context "without valid attributes" do
    it "is invalid without a body and image" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:body_or_image]).to include("を入力してください")
    end

    it "is invalid without group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect{ message.save }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "is invalid without user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect{ message.save }.to raise_error(ActiveRecord::StatementInvalid)
    end
  end
end
