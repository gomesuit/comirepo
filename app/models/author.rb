class Author < ApplicationRecord
  has_many :items, dependent: :destroy
end
