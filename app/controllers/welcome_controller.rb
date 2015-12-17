class WelcomeController < ApplicationController
  def index
    if current_user
      user = flickr_user(current_user.uid)
      @info = user_info(user.id)
      @photos = Photo.all(user.id)
    end
  end
end
