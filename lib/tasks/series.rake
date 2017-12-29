namespace :series do
  task :sample => :environment do
    Mechanize.start do |m|
      m.user_agent_alias = 'Mac Safari'
      m.get('https://www.amazon.co.jp/gp/search/other/ref=sr_sa_p_lbr_books_series_b?rh=n%3A2250738051%2Cn%3A%212250739051%2Cn%3A2275256051%2Cn%3A2293143051&sort=featured-rank&pickerToList=lbr_books_series_browse-bin')
      m.page.parser.css('.refinementLink').each do |x|
        items = Item.where('title like ?', "#{x.text} %")
                    .or(Item.where('title like ?', "#{x.text}　%"))
                    .or(Item.where('title like ?', "#{x.text}(%"))
                    .or(Item.where('title like ?', "#{x.text}（%"))
                    .or(Item.where('title like ?', "#{x.text}"))
                    .select(:title)
        if items.present?
          pp x.text
          pp items
        end
      end
    end
  end

  task :regist => :environment do
    Mechanize.start do |m|
      m.user_agent_alias = 'Mac Safari'
      m.get('https://www.amazon.co.jp/gp/search/other/ref=sr_sa_p_lbr_books_series_b?rh=n%3A2250738051%2Cn%3A%212250739051%2Cn%3A2275256051%2Cn%3A2293143051&sort=featured-rank&pickerToList=lbr_books_series_browse-bin')
      m.page.parser.css('.refinementLink').each do |x|
        items = Item.where('title like ?', "#{x.text} %")
                    .or(Item.where('title like ?', "#{x.text}　%"))
                    .or(Item.where('title like ?', "#{x.text}(%"))
                    .or(Item.where('title like ?', "#{x.text}（%"))
                    .or(Item.where('title like ?', "#{x.text}"))
        if items.present?
          pp x.text
          pp items
          series = Series.find_or_create_by(name: x.text)
          series.items = items
          series.save!
        end
      end
    end
  end
end
