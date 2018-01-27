class AddHidedToFooterAds < ActiveRecord::Migration[5.1]
  def change
    add_column :footer_ads, :hided, :boolean, default: false, null: false
  end
end
