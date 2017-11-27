class AddHidedToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :hided, :boolean, default: false, null: false
  end
end
