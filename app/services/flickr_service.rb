class FlickrService
  def initialize
    FlickRaw.api_key=(ENV['FLICKR_PUBLIC_KEY_PRO'])
    FlickRaw.shared_secret=(ENV['FLICKR_SECRET_KEY_PRO'])
  end

  def get_photos_by_user(user_id)
    flickr.people.getPhotos(user_id: user_id, per_page: 12)
  end

  def get_photo(photo_id)
    info = flickr.photos.getInfo(photo_id: photo_id)
  end

  def get_albums_by_user(user_id)
    flickr.photosets.getList(user_id)
  end

  def get_album_photos(album_id)
    flickr.photosets.getPhotos(photoset_id: album_id, per_page: 12).photo
  end

  def get_comments(photo_id)
    comments = flickr.photos.comments.getList(photo_id: photo_id)
    if comments.class == "Array"
      comments.map { |comment| comment._content }
    else
      []
    end
  end
end
