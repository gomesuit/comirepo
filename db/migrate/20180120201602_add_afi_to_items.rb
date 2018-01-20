class AddAfiToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :isbn10, :string
    add_column :items, :rakuten_url, :string
  end
end
