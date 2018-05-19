FactoryBot.define do
  factory :page_category do
    name Faker::Witcher.character
  end

  factory :invalid_page_category, parent: :page_category do |f|
    f.name nil
  end
end
