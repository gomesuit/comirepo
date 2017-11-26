class AddHidedToLabels < ActiveRecord::Migration[5.1]
  def change
    add_column :labels, :hided, :boolean, default: false, null: false
  end
end
