ActiveAdmin.register Page do
  permit_params :title

  index do
    selectable_column
    id_column
    column :title
    column 'Category' do |page|
      page.page_category.name.to_s
    end
    actions
  end

  filter :title

  form do |f|
    f.inputs "Page Details" do
      f.input :title
      f.input :page_category, label: 'Page category', collection: PageCategory.all
    end
    f.actions
  end
end
