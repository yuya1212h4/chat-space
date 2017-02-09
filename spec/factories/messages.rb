FactoryGirl.define do
  factory :message do
    body          "text"
    image         { Faker::Avatar.image }
    user_id       1
    group_id      1
  end
end
