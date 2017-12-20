class CreateBookshelves < ActiveRecord::Migration[5.1]
  def change
    create_table :bookshelves do |t|
      t.string :uuid, null: false, unique: true

      t.timestamps
    end
  end
end
