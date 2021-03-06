# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hided      :boolean          default("displayed"), not null
#

class Author < ApplicationRecord
  has_many :item_authors, dependent: :destroy
  has_many :items, through: :item_authors
  enum hided: { hided: true, displayed: false }
end
