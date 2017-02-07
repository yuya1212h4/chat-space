FactoryGirl.define do
  factory :user do
    name          { Faker::Name.name }
    email         { Faker::Internet.email }
    password      { Faker::Internet.password(8)}
    created_at    { Faker::Business.credit_card_expiry_date }
    updated_at    { Faker::Business.credit_card_expiry_date }
  end
end
