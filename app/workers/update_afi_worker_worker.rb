class UpdateAfiWorkerWorker
  include Sidekiq::Worker

  sidekiq_options retry: 3

  def perform(asin)
    item = Item.find_by(asin: asin)

    isbn = item.isbn10 || parse_isbn(asin)
    pp isbn
    return if isbn.nil?
    item.update!(isbn10: isbn)

    rakuten_url = get_rakuten_url(isbn)
    pp rakuten_url
    return if rakuten_url.nil?

    item.update!(rakuten_url: rakuten_url)
  end

  def parse_isbn(asin)
    Mechanize.start do |m|
      m.user_agent_alias = 'Mac Safari'
      Retryable.retryable(tries: 3, sleep: 5) do
        m.get("https://www.amazon.co.jp/dp/#{asin}")
      end
      elem = m.page.parser.css('.swatchElement a.a-button-text')[1]
      return if elem.nil?
      pp elem.attributes['href'].value
      pp elem.css('> span:nth-child(1)').text
      return unless %w[コミックス 単行本].include?(elem.css('> span:nth-child(1)').text)
      elem.attributes['href'].value.split('/')[3]
    end
  end

  def get_rakuten_url(isbn)
    RakutenWebService.configuration do |c|
      c.application_id = ENV['RAKUTEN_APPLICATION_ID']
      c.affiliate_id = ENV['RAKUTEN_AFFILIATE_ID'] # default: nil
      c.max_retries = 3 # default: 5
      c.debug = true # default: false
    end

    items = RakutenWebService::Books::Book.search(isbn: isbn)
    return nil if items.count == 0
    items.first.affiliate_url
  end
end
