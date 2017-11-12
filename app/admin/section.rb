ActiveAdmin.register Section do
  permit_params :title, :image, :content

  index do
    selectable_column
    id_column
    column 'Page' do |section|
      "#{section.page.title}"
    end
    column :title
    actions
  end

  filter :title

  form do |f|
    f.inputs "Section Details" do
      f.input :title
      f.input :image
      f.input :content
      f.input :page, label: 'Page', collection: Page.all
    end
    f.actions
  end
end
