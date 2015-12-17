class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :flickr_user, :first_album_photo, :get_photo, :user_info, :buddy_icon, :has_location?, :has_county?, :views

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def flickr_user(uid)
    flickr.people.findByUsername(username: current_user.user_name)
  end

  def first_album_photo(album)
    info = flickr.photos.getInfo(photo_id: album.primary)
    FlickRaw.url_m(info)
  end

  def get_photo(photo_id)
    info = flickr.photos.getInfo(photo_id: photo_id)
    FlickRaw.url_m(info)
  end

  def user_info(user_id)
    flickr.people.getInfo(user_id: user_id)
  end

  def buddy_icon
    user = flickr.people.getInfo(user_id: current_user.uid)
    "https://c1.staticflickr.com/#{user.iconfarm}/#{user.iconserver}/buddyicons/#{user.nsid}.jpg"
  end

  def views(photo)
    flickr.photos.getInfo(photo_id: photo.id).views
  end

  def has_location?(photo)
    if JSON.parse(photo.to_json).include?("location")
      photo
    else
      false
    end
  end

  def has_county?(photo)
    if JSON.parse(photo.to_json)["location"].include?("county")
      photo
    else
      false
    end
  end
end
