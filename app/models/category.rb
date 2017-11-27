# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  browse_node_id :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  hided          :boolean          default("displayed"), not null
#

class Category < ApplicationRecord
  has_many :item_categories, dependent: :destroy
  has_many :items, through: :item_categories
  enum hided: { hided: true, displayed: false }
end
