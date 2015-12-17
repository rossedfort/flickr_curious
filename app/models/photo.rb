class Photo
  def self.service
    FlickrService.new
  end

  def self.all(user_id)
    service.get_photos_by_user(user_id)
  end

  def self.show(photo_id)
    service.get_photo(photo_id)
  end

  def self.comments(photo_id)
    service.get_comments(photo_id)
  end
end
