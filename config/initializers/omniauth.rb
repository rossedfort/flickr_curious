Rails.application.config.middleware.use OmniAuth::Builder do
  provider :flickr, ENV["FLICKR_PUBLIC_KEY"], ENV["FLICKR_SECRET_KEY"], scope: "write"
end
