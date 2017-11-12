class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.string :image
      t.text :content

      t.timestamps null: false
    end
  end
end
