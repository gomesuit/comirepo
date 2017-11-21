SitemapGenerator::Sitemap.default_host = ENV['SITE_URL']

SitemapGenerator::Sitemap.create do
  add root_path
  add yesterday_path
  add today_path
  add tomorrow_path
  add thisweek_path
  add nextweek_path

  Item.all.each do |item|
    add item_path(item), lastmod: item.updated_at
  end
end
