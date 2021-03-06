SitemapGenerator::Sitemap.default_host = ENV['SITE_URL']

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new({
  fog_provider: 'AWS',
  fog_directory: ENV['AWS_BUCKET'],
  fog_region: 'ap-northeast-1',
  aws_access_key_id: ENV['AWS_ACCESS'],
  aws_secret_access_key: ENV['AWS_SECRET']
})

SitemapGenerator::Sitemap.create do
  add root_path
  add yesterday_items_path
  add today_items_path
  add tomorrow_items_path
  add thisweek_items_path
  add nextweek_items_path

  Item.not_limited_freedoms.each do |item|
    add item_path(item), lastmod: item.updated_at
  end

  Item.limited_freedoms.each do |item|
    add item_path(item), lastmod: item.updated_at
  end

  Author.all.each do |author|
    add author_path(author), lastmod: author.updated_at
  end

  ItemSeries.group(:series_id).each do |item_series|
    add series_path(item_series.series), lastmod: item_series.series.updated_at
  end
end
