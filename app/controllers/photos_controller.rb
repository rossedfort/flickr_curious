class PhotosController < ApplicationController
  def index
    user = flickr_user(current_user.uid)
    @photos = Photo.all(user.id)
  end

  def show
    @photo = Photo.show(params[:id])
  end
end
