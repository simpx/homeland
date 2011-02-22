require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Strategies::GitHub, '7f993125e9fdc431124f', 'c2f83e97d630fef629a5df932413b96740e88247'
Rails.application.config.middleware.use OmniAuth::Strategies::QQ, 'ea4a4609297141cf8cb7a1d545cb35d1', '18b0ab6e3a274af1494023dc9411b1c9'
Rails.application.config.middleware.use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'

