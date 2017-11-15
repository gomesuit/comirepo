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
#  is_adult_content :boolean          default(FALSE), not null
#  adult_score      :float            not null
#  is_racy_content  :boolean          default(FALSE), not null
#  racy_score       :float            not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  label_id         :integer
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
