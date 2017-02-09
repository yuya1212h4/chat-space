FactoryGirl.define do
  factory :group do
    name          "test"
    user_id       1
    created_at    { DateTime.now }
    updated_at    { DateTime.now }
  end
end
