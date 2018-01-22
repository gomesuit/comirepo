class CreateFooterAds < ActiveRecord::Migration[5.1]
  def change
    create_table :footer_ads do |t|
      t.string :name, null: false
      t.text  :name, null: false

      t.timestamps
    end
  end
end
