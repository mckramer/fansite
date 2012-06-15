Twitter.configure do |config|
  config.consumer_key = ApiKeys.twitter[:consumer_key]
  config.consumer_secret = ApiKeys.twitter[:consumer_secret]
  config.oauth_token = ApiKeys.twitter[:oauth_token]
  config.oauth_token_secret = ApiKeys.twitter[:oauth_token_secret]
end