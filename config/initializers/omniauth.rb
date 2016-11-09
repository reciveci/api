Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook,      ENV['facebook_id'], ENV['facebook_key']
    provider :twitter,       ENV['twitter_key'], ENV['twitter_secret']
end