Rails.application.config.middleware.use OmniAuth::Builder do
  provider :flickr, "FLICKR_PUBLIC_KEY", "FLICKR_SECRET_KEY"
end
