class AddIsMagazineToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :is_magazine, :boolean, default: false, null: false
  end
end
