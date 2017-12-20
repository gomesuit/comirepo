# == Schema Information
#
# Table name: bookshelves
#
#  id         :integer          not null, primary key
#  uuid       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bookshelf < ApplicationRecord
  has_many :bookshelf_items, dependent: :destroy
  has_many :items, through: :bookshelf_items

  before_create :init_uuid

  private

  def init_uuid
    self.uuid = SecureRandom.uuid
  end
end
