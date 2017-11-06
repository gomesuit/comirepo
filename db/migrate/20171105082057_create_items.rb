class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :detail_page_url
      t.string :asin
      t.string :small_image
      t.string :medium_image
      t.string :large_image
      t.references :author
      t.date :publication_date
      t.string :introduction

      t.timestamps
    end
  end
end
