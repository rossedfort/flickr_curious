class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :flickr_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def flickr_user(uid)
    flickr.people.findByUsername(username: current_user.user_name)
  end
end
