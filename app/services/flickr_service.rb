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

  def get_album_info(album_id, user_id)
    flickr.photosets.getInfo(photoset_id: album_id, user_id: user_id)
  end

  def get_comments(photo_id)
    comments = flickr.photos.comments.getList(photo_id: photo_id)
    parsed = parse(comments.to_json)
    if parsed.class == Array
      parsed.map { |comment, author| comment = comment["_content"], author = comment["authorname"] }
    else
      []
    end
  end

  def parse(content)
    JSON.parse(content)
  end
end
