Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid, :name=>'openid'
end

OmniAuth.config.logger = Rails.logger
