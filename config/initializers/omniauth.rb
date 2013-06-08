Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :twitter,  ENV['TWITTER_KEY'],  ENV['TWITTER_SECRET']
  else
    provider :developer
  end
end

OmniAuth.config.logger = Rails.logger
