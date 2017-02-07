FactoryGirl.define do

  factory :group do
    name          "test"
    user_id       "1"
    created_at    { Faker::Business.credit_card_expiry_date }
    updated_at    { Faker::Business.credit_card_expiry_date }
  end
end
