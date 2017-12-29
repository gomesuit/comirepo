# == Schema Information
#
# Table name: series
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Series < ApplicationRecord
  has_many :item_series, dependent: :destroy
  has_many :items, through: :item_series
end
