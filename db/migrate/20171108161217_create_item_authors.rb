class CreateItemAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :item_authors do |t|
      t.references :item, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
