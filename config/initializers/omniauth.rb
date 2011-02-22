require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Strategies::GitHub, '6cdd69717d7648e56110', 'dab5745aed84eaa2e03deb6a16da18fb825d228b'
Rails.application.config.middleware.use OmniAuth::Strategies::QQ, 'ea4a4609297141cf8cb7a1d545cb35d1', '18b0ab6e3a274af1494023dc9411b1c9'
Rails.application.config.middleware.use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'

