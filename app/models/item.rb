# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  detail_page_url  :string           not null
#  asin             :string           not null
#  small_image      :string
#  medium_image     :string
#  large_image      :string
#  publication_date :date             not null
#  introduction     :string           not null
#  is_adult_content :boolean          default(FALSE), not null
#  adult_score      :float            not null
#  is_racy_content  :boolean          default(FALSE), not null
#  racy_score       :float            not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  label_id         :integer
#

class Item < ApplicationRecord
  has_many :item_authors, dependent: :destroy
  has_many :authors, through: :item_authors
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  belongs_to :label

  class << self
    def today
      where(publication_date: Date.today)
    end

    def yesterday
      where(publication_date: Date.today - 1)
    end

    def tomorrow
      where(publication_date: Date.today + 1)
    end

    def thisweek
      where(publication_date: Date.today.beginning_of_week..Date.today.end_of_week)
    end

    def nextweek
      where(publication_date: Date.today.next_week.beginning_of_week..Date.today.next_week.end_of_week)
    end

    def publication_dates
      order(publication_date: :asc).pluck('DISTINCT publication_date')
    end

    def category_filter
      categories = [
        2293147051, # ボーイズラブコミックス
        12075851,   # ボーイズラブコミックス
        3432431051, # ティーンズラブ
        3686141051, # ロマンス
        2291905051, # ビジネス・経済
        2291948051, # 経営学
        3418785051  # コミック雑誌
      ]
      sub = select(:id).joins(:categories).where(categories: { browse_node_id: categories })
      where.not(id: sub)
    end

    def adult_filter
      where(is_adult_content: false, is_racy_content: false)
    end
  end
end
