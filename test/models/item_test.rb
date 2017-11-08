# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  detail_page_url  :string           not null
#  asin             :string           not null
#  small_image      :string
#  medium_image     :string
#  large_image      :string
#  publication_date :date             not null
#  introduction     :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
