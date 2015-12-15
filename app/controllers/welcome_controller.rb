class WelcomeController < ApplicationController
  def index
    @photos = flickr.photos.getRecent
  end
end
