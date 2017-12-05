class CreateItemTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :item_tweets do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :tweet_type, null: false

      t.timestamps
    end
  end
end
