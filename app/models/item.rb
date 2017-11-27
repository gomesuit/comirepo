# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  detail_page_url  :text             not null
#  asin             :string           not null
#  small_image      :string
#  medium_image     :string
#  large_image      :string
#  publication_date :date             not null
#  introduction     :text             not null
#  is_adult_content :boolean          default(FALSE), not null
#  adult_score      :float            not null
#  is_racy_content  :boolean          default(FALSE), not null
#  racy_score       :float            not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  label_id         :integer
#  free_last_date   :date
#

class Item < ApplicationRecord
  has_many :item_authors, dependent: :destroy
  has_many :authors, through: :item_authors
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  belongs_to :label, optional: true

  before_validation :save_free_last_date
  before_validation :save_label

  scope :published, -> do
    category_filter.adult_filter.label_filter.author_filter
  end

  scope :limited_freedoms, -> { where.not(free_last_date: nil) }
  scope :not_limited_freedoms, -> { where(free_last_date: nil) }

  def is_limited_free
    free_last_date.present?
  end

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

    def free_last_dates
      where('free_last_date >= ?', Date.today).order(free_last_date: :asc).pluck('DISTINCT free_last_date')
    end

    def category_filter
      categories = Category.hided.ids
      # categories = [
      #   2293147051, # ボーイズラブコミックス
      #   12075851,   # ボーイズラブコミックス
      #   3432431051, # ティーンズラブ
      #   3686141051, # ロマンス
      #   2291905051, # ビジネス・経済
      #   2291948051, # 経営学
      #   3686143051, # スポーツ
      #   3418785051  # コミック雑誌
      # ]
      sub = select(:id).joins(:categories).where(categories: { id: categories })
      where.not(id: sub)
    end

    def adult_filter
      where(is_adult_content: false, is_racy_content: false)
    end

    def label_filter
      labels = Label.hided.ids
      sub = select(:id).where(label_id: labels)
      where.not(id: sub)
    end

    def author_filter
      authors = Author.hided.ids
      sub = select(:id).joins(:authors).where(authors: { id: authors })
      where.not(id: sub)
    end
  end

  private

  def save_free_last_date
    reg = /(\d+年\d+月\d+日).*までの期間限定無料/
    match = introduction.match(reg)
    if match
      free_last_date = Date.strptime(match[1],'%Y年%m月%d日')
      self.free_last_date = free_last_date
    end
  end

  def save_label
    match = title.match(/.+\((.+?)\)/)
    if match
      label = Label.find_or_initialize_by(name: match[1])
      self.label = label
    end
  end
end
