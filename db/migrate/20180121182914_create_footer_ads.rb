class CreateFooterAds < ActiveRecord::Migration[5.1]
  def change
    create_table :footer_ads do |t|
      t.string :name, null: false
      t.text :dom_pc, null: false
      t.text :dom_sp, null: false

      t.timestamps
    end
  end
end
