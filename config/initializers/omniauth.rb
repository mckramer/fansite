Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'l2Wp6RHYVZ8r5FVx1OjPuw', '6DrjMTYEh3ogpZbJ0kbNSyJTFtBt8Nn0AlF2P5O3h7Y'
end