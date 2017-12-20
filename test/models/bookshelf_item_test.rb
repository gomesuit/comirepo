# == Schema Information
#
# Table name: bookshelf_items
#
#  id           :integer          not null, primary key
#  bookshelf_id :integer          not null
#  item_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class BookshelfItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
