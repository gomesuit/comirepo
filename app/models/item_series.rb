# == Schema Information
#
# Table name: item_series
#
#  id         :integer          not null, primary key
#  item_id    :integer          not null
#  series_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ItemSeries < ApplicationRecord
  belongs_to :item
  belongs_to :series
end
