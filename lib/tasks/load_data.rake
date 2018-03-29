namespace :load_data do

  desc "Loads all"
  task all: :environment do
    Rake::Task['load_data:page_categories'].invoke
  end

  desc "Create page categories"
  task page_categories: :environment do
    4.times do |_t|
      category = update_or_create_page_category(name: Faker::GameOfThrones.house)

      7.times do |page|
        page = update_or_create_page(
          title: Faker::Cat.name,
          page_category_id: category.id,
        )

        5.times do |_section|
          update_or_create_section(
            title: Faker::Friends.quote,
            image: Faker::Avatar.image("my-own-slug"),
            content: Faker::Lorem.paragraph,
            page_id: page.id,
          )
        end
      end
    end
  end

  # Helpers

  def update_or_create_page_category(attributes)
    page_category = PageCategory.find_or_initialize_by(name: attributes.delete(:name))
    page_category.update_attributes(attributes)
    page_category
  end

  def update_or_create_page(attributes)
    page = Page.find_or_initialize_by(title: attributes.delete(:title))
    page.update_attributes(attributes)
    page
  end

  def update_or_create_section(attributes)
    section = Section.find_or_initialize_by(title: attributes.delete(:title))
    section.update_attributes(attributes)
    section
  end
end
