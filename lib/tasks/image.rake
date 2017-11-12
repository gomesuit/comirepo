namespace :image do
  desc "実行処理の説明"
  task :sample do
    puts "Hello World"

    uri = URI('https://westcentralus.api.cognitive.microsoft.com/vision/v1.0/analyze')
    uri.query = URI.encode_www_form({
        'visualFeatures' => 'adult',
        'language' => 'en'
    })

    request = Net::HTTP::Post.new(uri.request_uri)
    request['Content-Type'] = 'application/json'
    request['Ocp-Apim-Subscription-Key'] = ENV['SUBSCRIPTION_KEY']
    body = {}
    body[:url] = 'https://images-fe.ssl-images-amazon.com/images/I/51%2BInxWXisL.jpg'
    request.body = body.to_json

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    puts response.body
  end
end
