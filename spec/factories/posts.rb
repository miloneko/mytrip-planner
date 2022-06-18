FactoryBot.define do
  factory :post do
    title { "Title" }
    association :user
  end
end
