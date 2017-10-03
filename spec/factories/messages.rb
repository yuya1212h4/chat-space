#include ActionDispatch::TestProcess
# ここにincludeを書くか、rails_helperに書くかのどちらか。

FactoryGirl.define do
  factory :message do
    body          "text"
    image         { fixture_file_upload("spec/fixtures/img/sample.png", 'image/png') }
    user_id       1
    group_id      1
  end
end
