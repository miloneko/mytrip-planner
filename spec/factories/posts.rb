FactoryBot.define do
  factory :posts do
    title { "Title" }
    association :user
  end
end