namespace :tweet do
  desc 'description'
  task :sample => :environment do
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMERKEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMERSECRET']
      config.access_token        = ENV['TWITTER_ACCESSTOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESSTOKENSECRET']
    end
    client.update("I'm tweeting with @gem!")
  end
end
