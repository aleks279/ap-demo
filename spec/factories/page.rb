FactoryBot.define do
  factory :page do
    title Faker::RickAndMorty.character
  end

  factory :invalid_page, parent: :page do |f|
    f.title nil
  end
end
