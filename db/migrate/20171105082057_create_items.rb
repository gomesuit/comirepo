class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :detail_page_url
      t.string :asin
      t.string :small_image
      t.srting :medium_image
      t.srting :large_image
      t.references :author
      t.date :publication_date
      t.srting :introduction

      t.timestamps
    end
  end
end
