FactoryGirl.define do
  factory :user do
    name          { Faker::Name.name }
    email         { Faker::Internet.email }
    password      { Faker::Internet.password(8)}
    password_confirmation { password }
    created_at    { DateTime.now }
    updated_at    { DateTime.now }
  end
end
