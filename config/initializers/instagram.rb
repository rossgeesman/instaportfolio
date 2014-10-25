require "instagram"

Instagram.configure do |config|
  config.client_id = ENV["INSTAGRAM_ID"]
  config.client_secret = ENV["INSTAGRAM_SECRET"]
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end

CALLBACK_URL = "http://www.whoami.prettymuchallofthetime.com/authentications/callback"