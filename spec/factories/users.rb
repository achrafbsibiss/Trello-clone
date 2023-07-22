FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@emxaple.com"}
    password { "password" }
  end
end
