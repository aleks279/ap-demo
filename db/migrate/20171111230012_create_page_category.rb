class CreatePageCategory < ActiveRecord::Migration
  def change
    create_table :page_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
