# == Schema Information
#
# Table name: item_categories
#
#  id          :integer          not null, primary key
#  item_id     :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ItemCategory < ApplicationRecord
  belongs_to :item
  belongs_to :category
end
