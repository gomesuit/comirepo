class AddHidedToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :hided, :boolean, default: false, null: false
  end
end
