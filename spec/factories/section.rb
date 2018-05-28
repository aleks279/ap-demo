FactoryBot.define do
  factory :section do
    title Faker::RickAndMorty.location
    content Faker::RickAndMorty.quote
  end

  factory :invalid_section, parent: :section do |f|
    f.title nil
    f.content nil
  end
end
