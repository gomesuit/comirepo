# == Schema Information
#
# Table name: item_authors
#
#  id         :integer          not null, primary key
#  item_id    :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ItemAuthor < ApplicationRecord
  belongs_to :item
  belongs_to :author
end
