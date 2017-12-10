# == Schema Information
#
# Table name: item_tweets
#
#  id         :integer          not null, primary key
#  item_id    :integer          not null
#  tweet_type :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ItemTweet < ApplicationRecord
  belongs_to :item
  enum tweet_type: { released: 0, scheduled: 1, free_last_date: 2 }
end
