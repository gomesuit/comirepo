# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  title            :string(255)      not null
#  detail_page_url  :text(65535)      not null
#  asin             :string(255)      not null
#  small_image      :string(255)
#  medium_image     :string(255)
#  large_image      :string(255)
#  publication_date :date             not null
#  introduction     :text(65535)      not null
#  is_adult_content :boolean          default(FALSE), not null
#  adult_score      :float(24)        not null
#  is_racy_content  :boolean          default(FALSE), not null
#  racy_score       :float(24)        not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  label_id         :integer
#  free_last_date   :date
#  is_magazine      :boolean          default("is_not_magazine"), not null
#  is_novel         :boolean          default("is_not_novel"), not null
#  cute_count       :integer          default(0), not null
#  cool_count       :integer          default(0), not null
#  funny_count      :integer          default(0), not null
#  horror_count     :integer          default(0), not null
#  isbn10           :string(255)
#  rakuten_url      :string(255)
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
