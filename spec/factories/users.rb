FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence(:email) { |n| "johndoe#{n}@example.com"}
  end
end
