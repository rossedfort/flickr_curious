class Album
  def self.service
    FlickrService.new
  end

  def self.all(user_id)
    service.get_albums_by_user(user_id)
  end

  def self.show(album_id)
    service.get_album_photos(album_id)
  end

  def self.info(album_id, user_id)
    service.get_album_info(album_id, user_id)
  end
end
