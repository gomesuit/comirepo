# == Schema Information
#
# Table name: bookshelf_items
#
#  id           :integer          not null, primary key
#  bookshelf_id :integer          not null
#  item_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class BookshelfItem < ApplicationRecord
  belongs_to :item
  belongs_to :bookshelf
end
