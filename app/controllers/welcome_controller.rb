class WelcomeController < ApplicationController
  def index
    @photos = flickr.people.getPhotos(user_id: '45646189@N06', per_page: 12)
  end
end
