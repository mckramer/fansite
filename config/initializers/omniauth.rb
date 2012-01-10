Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end