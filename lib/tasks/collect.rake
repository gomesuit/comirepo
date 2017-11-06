namespace :collect do
  task :sample => :environment do
    asins = []
    Mechanize.start do |m|
      m.get('https://www.amazon.co.jp/s/?rh=n%3A2250738051%2Cn%3A%212250739051%2Cn%3A2275256051%2Cn%3A2293143051%2Cp_n_date%3A2275273051')
      m.page.parser.xpath('//li[@class="s-result-item celwidget "]').each do |node|
        asins.push node.attributes['data-asin'].value
      end
    end

    # Amazon::Ecs::debug = true
    Amazon::Ecs.configure do |options|
      options[:endpoint] = 'webservices.amazon.co.jp'
      options[:AWS_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
      options[:AWS_secret_key] = ENV['AWS_SECRET_KEY']
      options[:associate_tag] = ENV['ASSOCIATE_TAG']
      options[:country] = 'jp'
      options[:response_group] = 'Large'
    end

    res = Amazon::Ecs.item_lookup(asins.first(10).join(','))
    res.items.each do |item|
      author = Author.find_or_create_by(name: item.get('ItemAttributes/Author'))
      Item.create!(
        title: item.get('ItemAttributes/Title'),
        detail_page_url: item.get('DetailPageURL'),
        asin: item.get('ASIN'),
        small_image: item.get('SmallImage'),
        medium_image: item.get('MediumImage'),
        large_image: item.get('LargeImage'),
        author: author,
        publication_date: Date.parse(item.get('ItemAttributes/ReleaseDate')),
        introduction: item.get('EditorialReviews/EditorialReview/Content')
      )
    end
  end
end
