class WelcomeController < ApplicationController
  def index
    user = flickr_user(current_user.uid)
    @photos = Photo.all(user.id)
  end
end
