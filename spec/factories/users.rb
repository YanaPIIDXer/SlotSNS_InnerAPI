FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User#{n}"}
    sequence(:email) { |n| "example#{n}@example.com"}
    sequence(:password) { |n| "Password#{n}" }
  end
end
