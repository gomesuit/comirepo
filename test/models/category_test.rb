# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string(255)      not null
#  browse_node_id :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  hided          :boolean          default("displayed"), not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
