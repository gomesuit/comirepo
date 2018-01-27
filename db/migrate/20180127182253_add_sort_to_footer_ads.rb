class AddSortToFooterAds < ActiveRecord::Migration[5.1]
  def change
    add_column :footer_ads, :sort, :integer, default: 0, null: false
  end
end
