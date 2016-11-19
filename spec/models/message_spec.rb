require 'rails_helper'
describe Message do
  describe '#create' do

    it "is invalid without a message" do
      message = Message.new(body: "")
      message.valid?
      expect(message.errors[:body]).to include("translation missing: ja.activerecord.errors.models.message.attributes.body.blank")
    end

    it "is effective with a message" do
      message = Message.new(body: "test")
      message.valid?
      expect(message.errors[:body]).to include()
    end

  end
end
