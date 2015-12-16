class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :flickr_user, :first_album_photo, :get_photo

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
end
