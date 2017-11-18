class ChangeDatatypeDetailPageUrlOfItems < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :detail_page_url, :text
    change_column :items, :introduction, :text
  end
end
