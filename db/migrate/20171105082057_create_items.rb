class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :detail_page_url, null: false
      t.string :asin, null: false
      t.string :small_image
      t.string :medium_image
      t.string :large_image
      t.date :publication_date, null: false
      t.string :introduction, null: false

      t.boolean :is_adult_content, null: false, default: false
      t.float :adult_score, null: false
      t.boolean :is_racy_content, null: false, default: false
      t.float :racy_score, null: false

      t.timestamps
    end
  end
end
