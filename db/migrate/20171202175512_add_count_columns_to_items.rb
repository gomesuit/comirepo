class AddCountColumnsToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :cute_count, :integer, default: 0, null: false
    add_column :items, :cool_count, :integer, default: 0, null: false
    add_column :items, :funny_count, :integer, default: 0, null: false
    add_column :items, :horror_count, :integer, default: 0, null: false
  end
end
