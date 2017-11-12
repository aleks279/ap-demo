class AddPageCategoryToPage < ActiveRecord::Migration
  def change
    add_reference :pages, :page_category, index: true, foreign_key: true
  end
end
