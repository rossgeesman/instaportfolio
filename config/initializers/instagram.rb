require "instagram"

Instagram.configure do |config|
  config.client_id = "8338e102168d4b578ff453179dffb48d"
  config.client_secret = "2659aca93566450ba37fecef86f84057"
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end

CALLBACK_URL = "http://localhost:3000/authentications/callback"