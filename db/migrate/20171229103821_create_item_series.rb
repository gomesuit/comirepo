class CreateItemSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :item_series do |t|
      t.references :item, null: false, foreign_key: true
      t.references :series, null: false, foreign_key: true

      t.timestamps
    end
  end
end
