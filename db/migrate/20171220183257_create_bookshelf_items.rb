class CreateBookshelfItems < ActiveRecord::Migration[5.1]
  def change
    create_table :bookshelf_items do |t|
      t.references :bookshelf, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
