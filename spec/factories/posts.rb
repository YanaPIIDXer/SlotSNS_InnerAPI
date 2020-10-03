FactoryBot.define do
  factory :post do
    sequence(:title) {|n| "Title#{n}"}
    sequence(:body) {|n| "Body#{n}\nBody#{n}\nBody#{n}\nBody#{n}\nBody#{n}\nBody#{n}"}
  end
end
