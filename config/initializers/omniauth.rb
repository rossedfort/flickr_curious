Rails.application.config.middleware.use OmniAuth::Builder do
  provider :flickr, ENV["FLICKR_PUBLIC_KEY_PRO"], ENV["FLICKR_SECRET_KEY_PRO"], scope: "write"
end
