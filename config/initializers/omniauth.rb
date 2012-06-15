require 'api_keys'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ApiKeys.twitter[:consumer_key], ApiKeys.twitter[:consumer_secret]
end