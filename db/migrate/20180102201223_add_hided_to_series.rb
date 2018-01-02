class AddHidedToSeries < ActiveRecord::Migration[5.1]
  def change
    add_column :series, :hided, :boolean, default: false, null: false
  end
end
