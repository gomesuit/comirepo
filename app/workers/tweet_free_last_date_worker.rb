class TweetFreeLastDateWorker
  include Sidekiq::Worker
  include Rails.application.routes.url_helpers
  Rails.application.routes.default_url_options[:host] = ENV['SITE_URL']

  def perform(*args)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMERKEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMERSECRET']
      config.access_token        = ENV['TWITTER_ACCESSTOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESSTOKENSECRET']
    end

    item = Item.published
               .where(free_last_date: Date.today)
               .not_tweet_free_last_date
               .order(:title)
               .first
    return if item.blank?

    contents =<<-EOS
【期間限定無料は今日まで！】 #Kindle
『<%= item.title %>』
<%= item_url(item) %>
    EOS

    erb = ERB.new(contents)
    #puts erb.result(binding)
    client.update(erb.result(binding))
    item.tweets.create!(tweet_type: :free_last_date)
  end
end
