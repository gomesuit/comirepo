# == Schema Information
#
# Table name: item_authors
#
#  id         :integer          not null, primary key
#  item_id    :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ItemAuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
