# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

configure do
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to 
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

run Sinatra::Application

Twitter.configure do |config|
  config.consumer_key = 'OZlHGv3n86qLEL2uw2r18Q'
  config.consumer_secret = 'TbL83kYgYaLAhgekK0NuTceJnHVzda9VjG32EA0Cs'
  config.oauth_token = '53588817-TeBQvYm5y7cSytaTMn1MYVdLzGFKpyy5YNUriGXmf'
  config.oauth_token_secret = 'MBXkNFHR518hke6oxEjghXZDcvpoBM7BphaffjqtcA'
end
