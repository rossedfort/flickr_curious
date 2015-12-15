class FlickrService
  def initialize
    FlickRaw.api_key=(ENV['FLICKR_PUBLIC_KEY_PRO'])
    FlickRaw.shared_secret=(ENV['FLICKR_SECRET_KEY_PRO'])
  end

  def get_photos_by_user(user_id)
    flickr.people.getPhotos(user_id: user_id)
  end

  def get_photo(photo_id)
    info = flickr.photos.getInfo(photo_id: photo_id)
    FlickRaw.url_b(info)
  end
end
