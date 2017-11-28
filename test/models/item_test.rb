# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  detail_page_url  :text             not null
#  asin             :string           not null
#  small_image      :string
#  medium_image     :string
#  large_image      :string
#  publication_date :date             not null
#  introduction     :text             not null
#  is_adult_content :boolean          default(FALSE), not null
#  adult_score      :float            not null
#  is_racy_content  :boolean          default(FALSE), not null
#  racy_score       :float            not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  label_id         :integer
#  free_last_date   :date
#  is_magazine      :boolean          default(FALSE), not null
#  is_novel         :boolean          default(FALSE), not null
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
