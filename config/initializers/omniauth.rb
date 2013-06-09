Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :developer
  else
    provider :twitter,  ENV['TWITTER_KEY'],  ENV['TWITTER_SECRET']
  end
end

OmniAuth.config.logger = Rails.logger
