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

require 'test_helper'

class ItemTweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
