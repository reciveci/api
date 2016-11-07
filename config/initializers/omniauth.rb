Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :github,        ENV['GITHUB_KEY'],   ENV['GITHUB_SECRET'],   scope: 'email,profile'
    provider :facebook,      ENV['facebook_id'], ENV['facebook_key']
#  provider :google_oauth2, ENV['GOOGLE_KEY'],   ENV['GOOGLE_SECRET']
end