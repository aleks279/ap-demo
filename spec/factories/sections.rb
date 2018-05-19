FactoryBot.define do
  factory :section do
    title Faker::RickAndMorty.location
    content Faker::RickAndMorty.quote
  end
end
