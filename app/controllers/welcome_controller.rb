class WelcomeController < ApplicationController
  def index
    if current_user
      user = flickr.people.findByUsername(username: current_user.user_name)
      @photos = flickr.people.getPhotos(user_id: user.id, per_page: 12)
    end
  end
end
