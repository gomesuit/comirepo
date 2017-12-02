SitemapGenerator::Sitemap.default_host = ENV['SITE_URL']

SitemapGenerator::Sitemap.create do
  add root_path
  add yesterday_items_path
  add today_items_path
  add tomorrow_items_path
  add thisweek_items_path
  add nextweek_items_path

  Item.all.each do |item|
    add item_path(item), lastmod: item.updated_at
  end
end
