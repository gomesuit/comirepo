class TweetReleasedWorker
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
           .today
           .not_tweet_released
           .order(:title)
           .first
    return if item.blank?

    contents =<<-EOS
【本日配信開始！】 #Kindle
『<%= item.title %>』
配信開始日:<%= item.publication_date %>
<%= item_url(item) %>
    EOS

    erb = ERB.new(contents)
    #puts erb.result(binding)
    client.update(erb.result(binding))
    item.tweets.create!(tweet_type: :released)
  end
end
