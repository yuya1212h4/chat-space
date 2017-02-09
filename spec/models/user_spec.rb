require 'rails_helper'

describe User, type: :model do
  describe '#create' do
    let(:user){ create(:user) }

    it "is vaild with a nickname, email, password, passwoerd_confirmation" do
      expect(user).to be_valid
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "is invalid with a duplicate email address" do
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid with a password that no match " do
      user = build(:user, password: "xxxxxx", password_confirmation: "xxxxxxx")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "xxxxx", password_confirmation: "xxxxx")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end
