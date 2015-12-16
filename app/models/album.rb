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
end
