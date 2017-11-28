class AddIsNovelToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :is_novel, :boolean, default: false, null: false
  end
end
