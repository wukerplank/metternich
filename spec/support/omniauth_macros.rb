module OmniauthMacros
  
  def mock_auth_hash(user)
    OmniAuth.config.mock_auth[:twitter] = {
      'provider'    => 'twitter', 
      'uid'         => user.twitter_uid, 
      'user_info'   => {
        'name'      => user.nickname,
        'nickname'  => user.nickname,
        'urls'      => {'twitter' => "www.twitter.com/#{user.nickname}"}
      },
      'credentials' => {
        'token'  => "mock_token",
        'secret' => "mock_secret"
      }
    }
  end
  
end
