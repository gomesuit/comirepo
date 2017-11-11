namespace :collect do
  desc 'description'

  def retry_on_error(times: 3)
    try = 0
    begin
      try += 1
      yield
    rescue
      pp "retry #{try}"
      sleep 5
      retry if try < times
      raise
    end
  end

  def amazon_ecs(asins)
    # Amazon::Ecs::debug = true
    Amazon::Ecs.configure do |options|
      options[:endpoint] = 'webservices.amazon.co.jp'
      options[:AWS_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
      options[:AWS_secret_key] = ENV['AWS_SECRET_KEY']
      options[:associate_tag] = ENV['ASSOCIATE_TAG']
      options[:country] = 'jp'
      options[:response_group] = 'Large'
    end
    Amazon::Ecs.item_lookup(asins.first(10).join(','))
  end

  def save_data(item)
    begin
      data = Item.find_or_initialize_by(asin: item.get('ASIN'))
      data.update_attributes(
        title: item.get('ItemAttributes/Title'),
        detail_page_url: item.get('DetailPageURL'),
        asin: item.get('ASIN'),
        small_image: item.get('SmallImage/URL'),
        medium_image: item.get('MediumImage/URL'),
        large_image: item.get('LargeImage/URL'),
        publication_date: Date.parse(item.get('ItemAttributes/ReleaseDate')),
        introduction: item.get('EditorialReviews/EditorialReview/Content')
      )
      pp data

      # category
      nodes = item.get_elements('BrowseNodes/BrowseNode')
      nodes.each do |node|
        category = Category.find_or_create_by(
          name: node.get('Name'),
          browse_node_id: node.get('BrowseNodeId')
        )
        pp category
        data.categories << category
      end

      # author
      nodes = item.get_array('ItemAttributes/Author')
      nodes.each do |node|
        author = Author.find_or_create_by(name: node)
        pp author
        data.authors << author
      end

      data.save!
    rescue => error
      pp item
      puts error.message
      p error.backtrace
    end
  end

  task :sample => :environment do
    asins = []
    Mechanize.start do |m|
      m.get('https://www.amazon.co.jp/s/?rh=n%3A2250738051%2Cn%3A%212250739051%2Cn%3A2275256051%2Cn%3A2293143051%2Cp_n_date%3A2275273051')
      m.page.parser.xpath('//li[@class="s-result-item celwidget "]').each do |node|
        # 画像がないものはスキップ
        next if node.css('.s-access-image.cfMarker').attribute('src').value.include? 'no-img'

        asin = node.attributes['data-asin'].value
        pp asin
        asins.push asin
      end
    end

    res = amazon_ecs(asins)
    res.items.each do |item|
      save_data(item)
    end
  end

  task :full => :environment do
    asins = []
    Mechanize.start do |m|
      m.get('https://www.amazon.co.jp/s/?rh=n%3A2250738051%2Cn%3A%212250739051%2Cn%3A2275256051%2Cn%3A2293143051%2Cp_n_date%3A2275273051')
      loop do
        m.page.parser.xpath('//li[@class="s-result-item celwidget "]').each do |node|
          pp node.attributes['data-asin'].value
          asins.push node.attributes['data-asin'].value
        end
        link = m.page.link_with(id: 'pagnNextLink')
        break if link.nil?
        sleep 5
        retry_on_error times: 10 do
          link.click
        end
      end
    end

    asins.each_slice(10) do |arr|
      res = []
      retry_on_error times: 10 do
        res = amazon_ecs(arr)
      end
      res.items.each do |item|
        save_data(item)
      end
      sleep 5
    end
  end
end
