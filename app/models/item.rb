# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  title            :string(255)      not null
#  detail_page_url  :text(65535)      not null
#  asin             :string(255)      not null
#  small_image      :string(255)
#  medium_image     :string(255)
#  large_image      :string(255)
#  publication_date :date             not null
#  introduction     :text(65535)      not null
#  is_adult_content :boolean          default(FALSE), not null
#  adult_score      :float(24)        not null
#  is_racy_content  :boolean          default(FALSE), not null
#  racy_score       :float(24)        not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  label_id         :integer
#  free_last_date   :date
#  is_magazine      :boolean          default("is_not_magazine"), not null
#  is_novel         :boolean          default("is_not_novel"), not null
#  cute_count       :integer          default(0), not null
#  cool_count       :integer          default(0), not null
#  funny_count      :integer          default(0), not null
#  horror_count     :integer          default(0), not null
#

class Item < ApplicationRecord
  has_many :item_authors, dependent: :destroy
  has_many :authors, through: :item_authors
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  has_one :item_series, dependent: :destroy
  has_one :series, through: :item_series

  belongs_to :label, optional: true
  has_many :tweets, class_name: 'ItemTweet', dependent: :destroy

  before_validation :save_free_last_date,
                    :save_label,
                    :save_is_magazine,
                    :save_is_novel

  enum is_magazine: { is_magazine: true, is_not_magazine: false }
  enum is_novel: { is_novel: true, is_not_novel: false }

  scope :published, -> do
    category_filter.adult_filter
                   .label_filter
                   .author_filter
                   .is_not_magazine
                   .is_not_novel
  end

  scope :limited_freedoms, -> { where.not(free_last_date: nil) }
  scope :not_limited_freedoms, -> { where(free_last_date: nil) }
  scope :cute, -> { where(cute_count: 1..Float::INFINITY).order(cute_count: :desc).order(publication_date: :asc) }
  scope :cool, -> { where(cool_count: 1..Float::INFINITY).order(cool_count: :desc).order(publication_date: :asc) }
  scope :funny, -> { where(funny_count: 1..Float::INFINITY).order(funny_count: :desc).order(publication_date: :asc) }
  scope :horror, -> { where(horror_count: 1..Float::INFINITY).order(horror_count: :desc).order(publication_date: :asc) }

  def published?
    Item.published.exists?(id)
  end

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

    def not_tweet_released
      sub = ItemTweet.released.pluck(:item_id)
      where.not(id: sub)
    end

    def not_tweet_free_last_date
      sub = ItemTweet.free_last_date.pluck(:item_id)
      where.not(id: sub)
    end

    def not_tweet_registed
      sub = ItemTweet.registed.pluck(:item_id)
      where.not(id: sub)
    end
  end

  private

  def save_free_last_date
    reg = /(\d+年\d+月\d+日)[\d:]*までの期間限定無料/
    match = introduction.match(reg)
    if match
      free_last_date = Date.strptime(match[1],'%Y年%m月%d日')
      self.free_last_date = free_last_date
    else
      reg = /(\d+年\d+月\d+日)までの期間限定/
      match = introduction.match(reg)
      if match
        free_last_date = Date.strptime(match[1],'%Y年%m月%d日')
        self.free_last_date = free_last_date
      end
    end
  end

  def save_label
    match = title.match(/.+\(([^0-9].+?)\)/)
    if match
      label = Label.find_or_initialize_by(name: match[1])
      self.label = label
    else
      self.label = nil
    end
  end

  def save_is_magazine
    self.is_magazine = :is_magazine if title.include?('[雑誌]')
  end

  def save_is_novel
    self.is_novel = :is_novel if title.include?('文庫')
  end
end
