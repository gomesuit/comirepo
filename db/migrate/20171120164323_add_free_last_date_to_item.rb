class AddFreeLastDateToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :free_last_date, :date
  end
end
